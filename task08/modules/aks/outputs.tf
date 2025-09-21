output "kube_config" {
  value     = azurerm_kubernetes_cluster.this.kube_config[0]
  sensitive = true
}

output "cluster_endpoint" {
  value = azurerm_kubernetes_cluster.this.kube_config[0].host
}

output "aks_agentpool_identity_client_id" {
  description = "Client ID of the existing user assigned identity for AKS agent pool"
  value       = data.azurerm_user_assigned_identity.aks_agentpool_identity.client_id
}