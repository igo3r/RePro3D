variable "config" {
  description = <<EOF
    Configuration for the Linux function app.
    - `name`: The name of the function app.
    - `resource_group_name`: The name of the resource group.
    - `location`: The location of the resource.
    - `tags`: (Optional) Tags to be applied to the resource.
    - `storage_account_name`: The name of the storage account.
    - `storage_account_access_key`: (Optional) The access key which will be used to access the backend storage account for the Function App. Conflicts with storage_uses_managed_identity.
    - `storage_uses_managed_identity`: (Optional) Should the Function App use Managed Identity to access the storage account. Conflicts with storage_account_access_key.
    - `service_plan_id`: The ID of the service plan.
    - `https_only`: Enable HTTPS only traffic.
    - `site_config`: (Optional) Configuration for site settings.
        - `always_on`: (Optional) If this Linux Web App is Always On enabled. Defaults to false.
        - `http2_enabled`: Specifies if the HTTP2 protocol should be enabled. Defaults to false.
        - `application_insights_connection_string`: (Optional) The Connection String for linking the Linux Function App to Application Insights.
    - `application_stack`: Configuration for application stack.
        - `python_version`: Python version for the function app.
    - `cors`: CORS settings.
        - `allowed_origins`: (Optional) Specifies a list of origins that should be allowed to make cross-origin calls.
        - `support_credentials`: (Optional) Are credentials allowed in CORS requests? Defaults to `false`.
    - `identity`: Configuration for the identity.
        - `type`: Type of managed identity.
    EOF
  type = object({
    name                          = string
    resource_group_name           = string
    location                      = string
    tags                          = optional(map(string), {})
    storage_account_name          = string
    storage_account_access_key    = optional(string)
    storage_uses_managed_identity = optional(bool, true)
    service_plan_id               = string
    https_only                    = bool
    site_config = optional(object({
      always_on                              = optional(bool, false)
      http2_enabled                          = optional(bool, false)
      application_insights_connection_string = optional(string)
    }))
    application_stack = object({
      python_version = string
    })
    cors = optional(object({
      allowed_origins     = optional(list(string))
      support_credentials = optional(bool, false)
    }))
    identity = object({
      type = string
    })
  })
}