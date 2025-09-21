variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure location for Key Vault"
}

variable "redis_name" {
  description = "Name of the Redis Cache instance"
  type        = string
}

variable "redis_capacity" {
  description = "Capacity of the Redis Cache instance"
  type        = number
}

variable "redis_sku" {
  description = "SKU name for Redis Cache"
  type        = string
}

variable "redis_sku_family" {
  description = "SKU family for Redis Cache"
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Key Vault secret name for Redis hostname"
  type        = string
}

variable "redis_primary_key_secret_name" {
  description = "Key Vault secret name for Redis primary access key"
  type        = string
}

variable "keyvault_id" {
  description = "The ID of the Key Vault to store Redis secrets in"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to resources."
}