variable "tags" {
  type        = map(string)
  description = "Common tags to apply to the AKS cluster."
}

variable "aks_name" {
  type        = string
  description = "Name of the Azure Kubernetes Service (AKS) cluster."
}

variable "location" {
  type        = string
  description = "Azure region where the AKS cluster will be deployed."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group in which to deploy the AKS cluster."
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

variable "acr_resource_id" {
  type        = string
  description = "The Azure Resource ID of the Azure Container Registry to assign pull permissions."
}

variable "key_vault_id" {
  type        = string
  description = "The Azure Resource ID of the Key Vault to allow the AKS cluster to access secrets."
}

variable "agentpool_name" {
  description = "Name of the AKS identity"
  type        = string
}

variable "agentpool_rg" {
  description = "Resource group of the AKS identity"
  type        = string
}
