resource "azurerm_storage_container" "this" {
  name                  = var.config.container_name
  storage_account_name  = var.config.storage_account_name
  container_access_type = var.config.container_access_type
}