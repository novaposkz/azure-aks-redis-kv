data "azurerm_client_config" "current" {}

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name            = var.node_pool_name
    node_count      = var.node_pool_count
    vm_size         = var.node_pool_vm_size
    os_disk_type    = var.node_pool_os_disk_type
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_resource_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id

  depends_on = [
    azurerm_kubernetes_cluster.this
  ]
}

resource "azurerm_key_vault_access_policy" "aks" {
  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id

  secret_permissions = [
    "Get",
    "List",
  ]

  depends_on = [
    azurerm_kubernetes_cluster.this,
  ]
}


data "azurerm_user_assigned_identity" "aks_agentpool_identity" {
  name                = var.agentpool_name
  resource_group_name = var.agentpool_rg

  depends_on = [
    azurerm_kubernetes_cluster.this,
  ]
}
