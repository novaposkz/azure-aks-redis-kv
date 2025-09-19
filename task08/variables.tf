variable "location" {
  description = "Azure region to deploy resources"
  type        = string
}

variable "keyvault_sku" {
  description = "SKU for Key Vault"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}

variable "name_prefix" {
  description = "Prefix for all resource names to ensure uniqueness"
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

variable "acr_sku" {
  description = "SKU for Azure Container Registry"
  type        = string
}

variable "dockerfile_path" {
  description = "Path to Dockerfile"
  type        = string
}

variable "context_path" {
  description = "Path to Docker build context"
  type        = string
}

variable "image_name" {
  description = "Docker image name including tag"
  type        = string
}

variable "git_pat" {
  description = "Git Personal Access Token for repo access"
  type        = string
  sensitive   = true
}

variable "node_pool_name" {
  type        = string
  description = "Name of the default AKS node pool."
}

variable "node_pool_count" {
  type        = number
  description = "Number of nodes to provision in the default node pool."
}

variable "node_pool_vm_size" {
  type        = string
  description = "VM size for the default AKS node pool."
}

variable "node_pool_os_disk_type" {
  type        = string
  description = "OS disk type for the AKS node pool (e.g., Ephemeral or Managed)."
}

variable "agentpool_name" {
  description = "Name of the AKS identity"
  type        = string
}

variable "agentpool_rg" {
  description = "Resource group of the AKS identity"
  type        = string
}
