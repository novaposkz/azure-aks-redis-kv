output "registry_login_server" {
  description = "Login server URL of the Azure Container Registry"
  value       = azurerm_container_registry.this.login_server
}

output "acr_username" {
  description = "Username for Azure Container Registry (admin user)"
  value       = azurerm_container_registry.this.admin_username
}

output "acr_password" {
  description = "Password for Azure Container Registry (admin user)"
  value       = azurerm_container_registry.this.admin_password
  sensitive   = true
}

output "acr_resource_id" {
  description = "The Azure Resource ID of the Azure Container Registry"
  value       = azurerm_container_registry.this.id
}
