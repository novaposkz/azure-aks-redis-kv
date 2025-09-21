# ========================================
# TERRAFORM OUTPUTS CONFIGURATION
# ========================================
# This file defines the outputs that will be displayed after successful deployment
# Author: Tani Bekeshev
# Email: tani_bekeshev@epam.com
# Project: EPAM DevOps - Containers in Azure (Task 08)
# ========================================

# ========================================
# AZURE CONTAINER INSTANCE OUTPUTS
# ========================================

output "aci_fqdn" {
  description = "Fully Qualified Domain Name (FQDN) of the application running in Azure Container Instance"
  value       = module.aci.aci_fqdn
}

# ========================================
# AZURE KUBERNETES SERVICE OUTPUTS
# ========================================

# Data source to get the LoadBalancer service information
data "kubernetes_service" "app_lb" {
  metadata {
    name      = "redis-flask-app-service"
    namespace = "default"
  }

  depends_on = [kubectl_manifest.service]
}

output "aks_lb_ip" {
  description = "Public LoadBalancer IP address for accessing the Flask application in AKS"
  value       = data.kubernetes_service.app_lb.status[0].load_balancer[0].ingress[0].ip
}

# ========================================
# ADDITIONAL USEFUL OUTPUTS
# ========================================

output "resource_group_name" {
  description = "Name of the main resource group containing all resources"
  value       = azurerm_resource_group.main.name
}

output "acr_login_server" {
  description = "Azure Container Registry login server URL"
  value       = module.acr.registry_login_server
}

output "aks_cluster_name" {
  description = "Name of the Azure Kubernetes Service cluster"
  value       = module.aks.aks_cluster_name
}

output "redis_hostname" {
  description = "Redis cache hostname for application connectivity"
  value       = module.redis.redis_hostname
}

output "keyvault_uri" {
  description = "Azure Key Vault URI for secret management"
  value       = module.keyvault.keyvault_uri
}