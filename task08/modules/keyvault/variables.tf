variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "keyvault_name" {
  type        = string
  description = "Name of the Key Vault"
}

variable "location" {
  type        = string
  description = "Azure location for Key Vault"
}

variable "keyvault_sku" {
  type        = string
  description = "SKU for Key Vault (e.g., standard or premium)"
  default     = "standard"
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to resources."
}
