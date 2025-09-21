# ========================================
# LOCAL VALUES CONFIGURATION
# ========================================
# This file defines local values that are used throughout the Terraform configuration
# Author: Tani Bekeshev
# Email: tani_bekeshev@epam.com
# Project: EPAM DevOps - Containers in Azure (Task 08)
# ========================================

locals {
  # ========================================
  # RESOURCE NAMING CONVENTION
  # ========================================
  # All resources follow a consistent naming pattern:
  # {name_prefix}-{resource_type}
  
  # Main resource group name
  rg_name = format("%s-rg", var.name_prefix)
  
  # Azure Container Instance name
  aci_name = format("%s-ci", var.name_prefix)
  
  # Azure Container Registry name (no hyphens allowed)
  acr_name = format("%scr", replace(var.name_prefix, "-", ""))
  
  # Azure Kubernetes Service name
  aks_name = format("%s-aks", var.name_prefix)
  
  # Azure Key Vault name
  keyvault_name = format("%s-kv", var.name_prefix)
  
  # Azure Redis Cache name
  redis_name = format("%s-redis", var.name_prefix)
}