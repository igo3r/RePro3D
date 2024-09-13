variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location where the resources are deployed to"
  type        = string
}

variable "tags" {
  description = "This Object is used to store information about the running deployment. Resources will be tagged with it"
  type        = map(string)
  default     = {}
}

variable "config" {
  description = <<EOF
Configuration for the Windows function app.
- `name`: The name of the function app.
- `https_only`: A boolean to enforce HTTPS only.
- `storage_account_name`: (Optional) The name of the storage account associated with the function app.
- `storage_account_access_key`: (Optional) The access key for the storage account.
- `service_plan_id`: (Optional) The ID of the service plan for the function app.
- `zip_deploy_file`: (Optional) The path to the zip file to deploy.
- `virtual_network_subnet_id`: (Optional) The ID of the virtual network subnet.
- `app_settings`: (Optional) A map of application settings.
- `sticky_settings`: (Optional) A list of sticky settings, each containing a list of app setting names that should be sticky.
- `site_config`: (Optional) An object containing site configuration settings, including:
  - `always_on`: (Optional) Whether the app is always on.
  - `http2_enabled`: (Optional) Whether HTTP/2 is enabled.
  - `ftps_state`: (Optional) The state of FTPS.
  - `application_insights_connection_string`: (Optional) The connection string for Application Insights.
  - `application_insights_key`: (Optional) The key for Application Insights.
  - `application_stack_dotnet_version`: (Optional) The .NET version for the application stack.
  - `cors_allowed_origins`: (Optional) A list of allowed CORS origins.
  - `cors_support_credentials`: (Optional) Whether CORS supports credentials.
EOF
  type = object({
    name                       = string
    https_only                 = bool
    storage_account_name       = optional(string)
    storage_account_access_key = optional(string)
    service_plan_id            = optional(string)
    zip_deploy_file            = optional(string)
    virtual_network_subnet_id  = optional(string)
    app_settings               = optional(map(string))
    sticky_settings = optional(list(object({
      app_setting_names = list(string)
    })))
    site_config = optional(object({
      always_on                              = optional(bool)
      http2_enabled                          = optional(bool)
      ftps_state                             = optional(string)
      application_insights_connection_string = optional(string)
      application_insights_key               = optional(string)
      application_stack_dotnet_version       = optional(string)
      cors_allowed_origins                   = optional(list(string))
      cors_support_credentials               = optional(bool)
    }))
  })
}

