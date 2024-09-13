resource "azurerm_windows_function_app" "this" {
  name                       = var.config.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  tags                       = var.tags
  https_only                 = var.config.https_only
  storage_account_name       = var.config.storage_account_name
  storage_account_access_key = var.config.storage_account_access_key
  service_plan_id            = var.config.service_plan_id
  zip_deploy_file            = var.config.zip_deploy_file
  virtual_network_subnet_id  = var.config.virtual_network_subnet_id
  app_settings               = var.config.app_settings

  sticky_settings {
    app_setting_names = var.config.sticky_settings[0].app_setting_names
  }

  site_config {
    always_on                              = var.config.site_config.always_on
    application_insights_connection_string = var.config.site_config.application_insights_connection_string
    application_insights_key               = var.config.site_config.application_insights_key
    http2_enabled                          = var.config.site_config.http2_enabled
    ftps_state                             = var.config.site_config.ftps_state

    application_stack {
      dotnet_version = var.config.site_config.application_stack_dotnet_version
    }

    cors {
      allowed_origins     = var.config.site_config.cors_allowed_origins
      support_credentials = var.config.site_config.cors_support_credentials
    }
  }
}