resource "azurerm_redis_cache" "this" {
  name                = var.redis_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.redis_capacity
  family              = var.redis_sku_family
  sku_name            = var.redis_sku
  minimum_tls_version = "1.2"
  tags                = var.tags
}

# This must be deleted manually from CLI
resource "azurerm_key_vault_secret" "hostname" {
  name         = var.redis_hostname_secret_name
  value        = azurerm_redis_cache.this.hostname
  key_vault_id = var.keyvault_id
}

# This must be deleted manually from CLI
resource "azurerm_key_vault_secret" "primary_key" {
  name         = var.redis_primary_key_secret_name
  value        = azurerm_redis_cache.this.primary_access_key
  key_vault_id = var.keyvault_id
}
