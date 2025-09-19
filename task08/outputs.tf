output "aci_fqdn" {
  value       = module.aci.aci_fqdn
  description = "FQDN of App in Azure Container Instance"
}


data "kubernetes_service" "app_lb" {
  metadata {
    name      = "redis-flask-app-service"
    namespace = "default"
  }

  depends_on = [kubectl_manifest.service]
}

output "aks_lb_ip" {
  description = "Public Load Balancer IP address for the AKS app"
  value       = data.kubernetes_service.app_lb.status[0].load_balancer[0].ingress[0].ip
}