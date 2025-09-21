output "redis_primary_key_secret_value" {
  description = "The Redis primary access key (fetched from azurerm_redis_cache)"
  value       = azurerm_redis_cache.this.primary_access_key
  sensitive   = true
}

output "redis_hostname_secret_value" {
  description = "The Redis hostname"
  value       = azurerm_redis_cache.this.hostname
}
