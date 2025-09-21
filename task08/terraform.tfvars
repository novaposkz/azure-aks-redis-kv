name_prefix  = "cmtr-f4p05tns-mod8"
location     = "centralus"
keyvault_sku = "standard"

redis_capacity                = 2
redis_sku                     = "Basic"
redis_sku_family              = "C"
redis_primary_key_secret_name = "redis-primary-key"
redis_hostname_secret_name    = "redis-hostname"

acr_sku                = "Basic"
dockerfile_path        = "application/Dockerfile"
context_path           = "application"
image_name             = "cmtr-f4p05tns-mod8-app"
node_pool_name         = "system"
node_pool_count        = 1
node_pool_vm_size      = "Standard_D2ads_v5"
node_pool_os_disk_type = "Ephemeral"

agentpool_name = "cmtr-f4p05tns-mod8-aks-agentpool"
agentpool_rg   = "MC_cmtr-f4p05tns-mod8-rg_cmtr-f4p05tns-mod8-aks_centralus"

tags = {
  Creator = "tani_bekeshev@epam.com"
}