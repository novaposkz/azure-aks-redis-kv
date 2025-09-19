resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}


module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  keyvault_name       = local.keyvault_name
  location            = var.location
  keyvault_sku        = var.keyvault_sku
  tags                = var.tags

  depends_on = [azurerm_resource_group.main]
}

module "redis" {
  source                        = "./modules/redis"
  resource_group_name           = azurerm_resource_group.main.name
  location                      = var.location
  redis_name                    = local.redis_name
  redis_capacity                = var.redis_capacity
  redis_sku                     = var.redis_sku
  redis_sku_family              = var.redis_sku_family
  keyvault_id                   = module.keyvault.keyvault_id
  redis_hostname_secret_name    = var.redis_hostname_secret_name
  redis_primary_key_secret_name = var.redis_primary_key_secret_name
  tags                          = var.tags

  depends_on = [module.keyvault]
}

module "acr" {
  source              = "./modules/acr"
  acr_name            = local.acr_name
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  acr_sku             = var.acr_sku
  dockerfile_path     = var.dockerfile_path
  context_path        = var.context_path
  image_name          = var.image_name
  git_pat             = var.git_pat
  tags                = var.tags

  depends_on = [azurerm_resource_group.main]
}

module "aci" {
  source                         = "./modules/aci"
  aci_name                       = local.aci_name
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  image_name                     = var.image_name
  acr_login_server               = module.acr.registry_login_server
  acr_username                   = module.acr.acr_username
  acr_password                   = module.acr.acr_password
  redis_hostname_secret_value    = module.redis.redis_hostname_secret_value
  redis_primary_key_secret_value = module.redis.redis_primary_key_secret_value
  tags                           = var.tags

  depends_on = [module.acr, module.redis]
}

module "aks" {
  source = "./modules/aks"

  aks_name               = local.aks_name
  location               = var.location
  resource_group_name    = azurerm_resource_group.main.name
  node_pool_name         = var.node_pool_name
  node_pool_count        = var.node_pool_count
  node_pool_vm_size      = var.node_pool_vm_size
  node_pool_os_disk_type = var.node_pool_os_disk_type

  agentpool_rg   = var.agentpool_rg
  agentpool_name = var.agentpool_name

  acr_resource_id = module.acr.acr_resource_id
  key_vault_id    = module.keyvault.keyvault_id
  tags            = var.tags

  depends_on = [module.acr, module.keyvault, module.redis]
}

############################# THIS IS THE PROBLEM
resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.aks_agentpool_identity_client_id,
    kv_name                    = module.keyvault.keyvault_name,
    redis_url_secret_name      = var.redis_hostname_secret_name,
    redis_password_secret_name = var.redis_primary_key_secret_name,
    tenant_id                  = module.keyvault.tenant_id,
  })

  depends_on = [module.aks, module.keyvault]
}
#############################

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.registry_login_server,
    app_image_name   = var.image_name,
    image_tag        = "v1",
  })

  depends_on = [module.acr, module.keyvault, module.redis, module.aks, kubectl_manifest.secret_provider]

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }
}


resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  depends_on = [kubectl_manifest.deployment]

  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }
}