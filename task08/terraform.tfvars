name_prefix  = "cmtr-wbdw4cma-mod8"
location     = "centralus"
keyvault_sku = "standard"

redis_capacity                = 2
redis_sku                     = "Basic"
redis_sku_family              = "C"
redis_primary_key_secret_name = "redis-primary-key"
redis_hostname_secret_name    = "redis-hostname"

acr_sku                = "Basic"
dockerfile_path        = "Dockerfile"
context_path           = "https://github.com/otarbakh/epam-task08#main:task08/application"
image_name             = "cmtr-wbdw4cma-mod8-app"
node_pool_name         = "system"
node_pool_count        = 1
node_pool_vm_size      = "Standard_D2ads_v5"
node_pool_os_disk_type = "Ephemeral"

agentpool_name = "cmtr-wbdw4cma-mod8-aks-agentpool"
agentpool_rg   = "MC_cmtr-wbdw4cma-mod8-rg_cmtr-wbdw4cma-mod8-aks_centralus"

tags = {
  Creator = "otar_bakhtadze@epam.com"
}