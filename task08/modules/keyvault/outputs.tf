output "keyvault_id" {
  description = "ID of the Key Vault"
  value       = azurerm_key_vault.this.id
}

output "keyvault_name" {
  description = "Name of the Key Vault"
  value       = azurerm_key_vault.this.name
}

output "keyvault_uri" {
  description = "Vault URI"
  value       = azurerm_key_vault.this.vault_uri
}

output "tenant_id" {
  description = "Tenant ID of the current user"
  value       = data.azurerm_client_config.current.tenant_id
}