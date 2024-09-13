<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_windows_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | Configuration for the Windows function app.<br>- `name`: The name of the function app.<br>- `https_only`: A boolean to enforce HTTPS only.<br>- `storage_account_name`: (Optional) The name of the storage account associated with the function app.<br>- `storage_account_access_key`: (Optional) The access key for the storage account.<br>- `service_plan_id`: (Optional) The ID of the service plan for the function app.<br>- `zip_deploy_file`: (Optional) The path to the zip file to deploy.<br>- `virtual_network_subnet_id`: (Optional) The ID of the virtual network subnet.<br>- `app_settings`: (Optional) A map of application settings.<br>- `sticky_settings`: (Optional) A list of sticky settings, each containing a list of app setting names that should be sticky.<br>- `site_config`: (Optional) An object containing site configuration settings, including:<br>  - `always_on`: (Optional) Whether the app is always on.<br>  - `http2_enabled`: (Optional) Whether HTTP/2 is enabled.<br>  - `ftps_state`: (Optional) The state of FTPS.<br>  - `application_insights_connection_string`: (Optional) The connection string for Application Insights.<br>  - `application_insights_key`: (Optional) The key for Application Insights.<br>  - `application_stack_dotnet_version`: (Optional) The .NET version for the application stack.<br>  - `cors_allowed_origins`: (Optional) A list of allowed CORS origins.<br>  - `cors_support_credentials`: (Optional) Whether CORS supports credentials. | <pre>object({<br>    name                       = string<br>    https_only                 = bool<br>    storage_account_name       = optional(string)<br>    storage_account_access_key = optional(string)<br>    service_plan_id            = optional(string)<br>    zip_deploy_file            = optional(string)<br>    virtual_network_subnet_id  = optional(string)<br>    app_settings               = optional(map(string))<br>    sticky_settings = optional(list(object({<br>      app_setting_names = list(string)<br>    })))<br>    site_config = optional(object({<br>      always_on                              = optional(bool)<br>      http2_enabled                          = optional(bool)<br>      ftps_state                             = optional(string)<br>      application_insights_connection_string = optional(string)<br>      application_insights_key               = optional(string)<br>      application_stack_dotnet_version       = optional(string)<br>      cors_allowed_origins                   = optional(list(string))<br>      cors_support_credentials               = optional(bool)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where the resources are deployed to | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the Resource Group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | This Object is used to store information about the running deployment. Resources will be tagged with it | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->