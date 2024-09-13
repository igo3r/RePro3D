resource "azurerm_application_insights" "this" {
  name                = var.config.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  application_type    = var.config.application_type
  sampling_percentage = var.config.sampling_percentage
  workspace_id        = var.config.workspace_id
}