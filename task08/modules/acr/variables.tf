variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
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

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}
