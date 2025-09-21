resource "azurerm_container_group" "this" {
  name                = var.aci_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  dns_name_label      = "aci-label-python"
  ip_address_type     = "Public"

  container {
    name   = "python-app"
    image  = "${var.acr_login_server}/${var.image_name}:v1"
    cpu    = 1
    memory = 1.5

    environment_variables = {
      CREATOR        = "ACI"
      REDIS_PORT     = "6380"
      REDIS_SSL_MODE = "True"
    }

    secure_environment_variables = {
      REDIS_URL = var.redis_hostname_secret_value
      REDIS_PWD = var.redis_primary_key_secret_value
    }

    ports {
      port     = 8080
      protocol = "TCP"
    }
  }

  image_registry_credential {
    server   = var.acr_login_server
    username = var.acr_username
    password = var.acr_password
  }

  tags = var.tags
}
