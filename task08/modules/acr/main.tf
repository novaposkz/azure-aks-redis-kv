resource "azurerm_container_registry" "this" {
  name                = var.acr_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.acr_sku
  admin_enabled       = true
  tags                = var.tags
}

resource "azurerm_container_registry_task" "build_task" {
  name                  = "${var.acr_name}-build-task"
  container_registry_id = azurerm_container_registry.this.id

  platform {
    os = "Linux"
  }

  docker_step {
    dockerfile_path      = var.dockerfile_path
    context_path         = var.context_path
    context_access_token = var.git_pat
    image_names          = ["${var.image_name}:v1"]
  }

  depends_on = [azurerm_container_registry.this]
}

resource "azurerm_container_registry_task_schedule_run_now" "run_schedule" {
  container_registry_task_id = azurerm_container_registry_task.build_task.id

  depends_on = [
    azurerm_container_registry_task.build_task
  ]

  # Добавляем timeout для задачи
  timeouts {
    create = "15m"
    read   = "5m"
    delete = "10m"
  }
}
