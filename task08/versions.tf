# ========================================
# TERRAFORM VERSION AND PROVIDER CONFIGURATION
# ========================================
# This file defines the required Terraform version and provider versions
# Author: Tani Bekeshev
# Email: tani_bekeshev@epam.com
# Project: EPAM DevOps - Containers in Azure (Task 08)
# ========================================

terraform {
  # ========================================
  # TERRAFORM VERSION REQUIREMENTS
  # ========================================
  required_version = ">= 1.5.7"

  # ========================================
  # REQUIRED PROVIDERS
  # ========================================
  required_providers {
    # Azure Resource Manager provider for managing Azure resources
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.110.0, < 4.0.0"
    }

    # Azure API provider for advanced Azure resource management
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.5"
    }

    # Kubernetes provider for managing Kubernetes resources
    kubectl = {
      source  = "alekc/kubectl"
      version = ">= 2.0.0"
    }
  }
}

# ========================================
# PROVIDER CONFIGURATIONS
# ========================================

# Azure Resource Manager provider configuration
provider "azurerm" {
  features {
    # Enable features that are commonly used
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

# Kubectl provider configuration for AKS cluster
provider "kubectl" {
  host                   = module.aks.cluster_endpoint
  client_certificate     = base64decode(module.aks.kube_config["client_certificate"])
  client_key             = base64decode(module.aks.kube_config["client_key"])
  cluster_ca_certificate = base64decode(module.aks.kube_config["cluster_ca_certificate"])
  load_config_file       = false
}

# Kubernetes provider configuration (alternative to kubectl)
provider "kubernetes" {
  host                   = module.aks.cluster_endpoint
  client_certificate     = base64decode(module.aks.kube_config["client_certificate"])
  client_key             = base64decode(module.aks.kube_config["client_key"])
  cluster_ca_certificate = base64decode(module.aks.kube_config["cluster_ca_certificate"])
}