resource "azurerm_service_plan" "this" {
  name                   = var.config.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  tags                   = var.tags
  os_type                = var.config.os_type
  sku_name               = var.config.sku_name
  zone_balancing_enabled = var.config.zone_balancing_enabled
}