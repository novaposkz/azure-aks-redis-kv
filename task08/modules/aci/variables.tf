variable "aci_name" {
  description = "Name of the Azure Container Instance (Container Group)"
  type        = string
}

variable "location" {
  description = "Azure region for the ACI"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which to deploy ACI"
  type        = string
}

variable "image_name" {
  description = "Docker image name (including tag)"
  type        = string
}

variable "acr_login_server" {
  description = "Login server of ACR (e.g. cmtr.azurecr.io)"
  type        = string
}

variable "acr_username" {
  description = "Username to authenticate with ACR"
  type        = string
}

variable "acr_password" {
  description = "Password to authenticate with ACR"
  type        = string
  sensitive   = true
}

variable "redis_hostname_secret_value" {
  description = "Redis hostname, retrieved from Key Vault"
  type        = string
  sensitive   = true
}

variable "redis_primary_key_secret_value" {
  description = "Redis primary key, retrieved from Key Vault"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to the ACI"
  type        = map(string)
}
