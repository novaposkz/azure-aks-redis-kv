# ========================================
# TERRAFORM VARIABLES CONFIGURATION
# ========================================
# This file contains all variable definitions for the Azure infrastructure
# Author: Tani Bekeshev
# Email: tani_bekeshev@epam.com
# Project: EPAM DevOps - Containers in Azure (Task 08)
# ========================================

# ========================================
# GENERAL CONFIGURATION
# ========================================

variable "name_prefix" {
  description = "Prefix for all resource names to ensure uniqueness across deployments"
  type        = string
}

variable "location" {
  description = "Azure region where all resources will be deployed"
  type        = string
  default     = "centralus"
}

variable "tags" {
  description = "A map of tags to assign to all resources for organization and cost tracking"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "EPAM-DevOps-Module8"
    ManagedBy   = "Terraform"
  }
}

# ========================================
# AZURE KEY VAULT CONFIGURATION
# ========================================

variable "keyvault_sku" {
  description = "SKU tier for Azure Key Vault (standard or premium)"
  type        = string
  default     = "standard"
}

# ========================================
# AZURE REDIS CACHE CONFIGURATION
# ========================================

variable "redis_capacity" {
  description = "Capacity of the Redis Cache instance (number of cache nodes)"
  type        = number
  default     = 2
}

variable "redis_sku" {
  description = "SKU name for Redis Cache (Basic, Standard, or Premium)"
  type        = string
  default     = "Basic"
}

variable "redis_sku_family" {
  description = "SKU family for Redis Cache (C for Basic/Standard, P for Premium)"
  type        = string
  default     = "C"
}

variable "redis_hostname_secret_name" {
  description = "Name of the Key Vault secret that stores the Redis hostname"
  type        = string
  default     = "redis-hostname"
}

variable "redis_primary_key_secret_name" {
  description = "Name of the Key Vault secret that stores the Redis primary access key"
  type        = string
  default     = "redis-primary-key"
}

# ========================================
# AZURE CONTAINER REGISTRY CONFIGURATION
# ========================================

variable "acr_sku" {
  description = "SKU tier for Azure Container Registry (Basic, Standard, or Premium)"
  type        = string
  default     = "Basic"
}

variable "dockerfile_path" {
  description = "Path to the Dockerfile within the build context"
  type        = string
  default     = "Dockerfile"
}

variable "context_path" {
  description = "Path to the build context (can be local path or GitHub URL)"
  type        = string
}

variable "image_name" {
  description = "Name of the Docker image to build and store in ACR"
  type        = string
}

variable "git_pat" {
  description = "GitHub Personal Access Token for accessing private repositories"
  type        = string
  sensitive   = true
}

# ========================================
# AZURE KUBERNETES SERVICE CONFIGURATION
# ========================================

variable "node_pool_name" {
  description = "Name of the default AKS node pool"
  type        = string
  default     = "system"
}

variable "node_pool_count" {
  description = "Number of nodes to provision in the default node pool"
  type        = number
  default     = 1
}

variable "node_pool_vm_size" {
  description = "VM size for the default AKS node pool"
  type        = string
  default     = "Standard_D2ads_v5"
}

variable "node_pool_os_disk_type" {
  description = "OS disk type for the AKS node pool (Ephemeral or Managed)"
  type        = string
  default     = "Ephemeral"
}

variable "agentpool_name" {
  description = "Name of the AKS managed identity for the agent pool"
  type        = string
}

variable "agentpool_rg" {
  description = "Resource group name where the AKS agent pool managed identity is located"
  type        = string
}