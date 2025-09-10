resource "azurerm_service_plan" "this" {
  name                = var.name
  location            = var.location
  sku_name            = var.sku_name
  worker_count        = var.worker_count
  resource_group_name = var.resource_group
  os_type             = var.os_type
  tags                = var.tags
}