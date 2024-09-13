resource "azurerm_linux_function_app" "this" {
  name                          = var.config.name
  resource_group_name           = var.config.resource_group_name
  location                      = var.config.location
  tags                          = var.config.tags
  storage_account_name          = var.config.storage_account_name
  storage_account_access_key    = var.config.storage_account_access_key
  storage_uses_managed_identity = var.config.storage_uses_managed_identity
  service_plan_id               = var.config.service_plan_id
  https_only                    = var.config.https_only

  site_config {
    always_on                              = var.config.site_config.always_on
    http2_enabled                          = var.config.site_config.http2_enabled
    application_insights_connection_string = var.config.site_config.application_insights_connection_string

    application_stack {
      python_version = var.config.application_stack.python_version
    }

    cors {
      allowed_origins     = var.config.cors.allowed_origins
      support_credentials = var.config.cors.support_credentials
    }
  }

  identity {
    type = var.config.identity.type
  }
}
