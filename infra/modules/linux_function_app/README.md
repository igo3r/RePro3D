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
| [azurerm_linux_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | Configuration for the Linux function app.<br>    - `name`: The name of the function app.<br>    - `resource_group_name`: The name of the resource group.<br>    - `location`: The location of the resource.<br>    - `tags`: (Optional) Tags to be applied to the resource.<br>    - `storage_account_name`: The name of the storage account.<br>    - `storage_account_access_key`: (Optional) The access key which will be used to access the backend storage account for the Function App. Conflicts with storage\_uses\_managed\_identity.<br>    - `storage_uses_managed_identity`: (Optional) Should the Function App use Managed Identity to access the storage account. Conflicts with storage\_account\_access\_key.<br>    - `service_plan_id`: The ID of the service plan.<br>    - `https_only`: Enable HTTPS only traffic.<br>    - `site_config`: (Optional) Configuration for site settings.<br>        - `always_on`: (Optional) If this Linux Web App is Always On enabled. Defaults to false.<br>        - `http2_enabled`: Specifies if the HTTP2 protocol should be enabled. Defaults to false.<br>        - `application_insights_connection_string`: (Optional) The Connection String for linking the Linux Function App to Application Insights.<br>    - `application_stack`: Configuration for application stack.<br>        - `python_version`: Python version for the function app.<br>    - `cors`: CORS settings.<br>        - `allowed_origins`: (Optional) Specifies a list of origins that should be allowed to make cross-origin calls.<br>        - `support_credentials`: (Optional) Are credentials allowed in CORS requests? Defaults to `false`.<br>    - `identity`: Configuration for the identity.<br>        - `type`: Type of managed identity. | <pre>object({<br>    name                          = string<br>    resource_group_name           = string<br>    location                      = string<br>    tags                          = optional(map(string), {})<br>    storage_account_name          = string<br>    storage_account_access_key    = optional(string)<br>    storage_uses_managed_identity = optional(bool, true)<br>    service_plan_id               = string<br>    https_only                    = bool<br>    site_config = optional(object({<br>      always_on                              = optional(bool, false)<br>      http2_enabled                          = optional(bool, false)<br>      application_insights_connection_string = optional(string)<br>    }))<br>    application_stack = object({<br>      python_version = string<br>    })<br>    cors = optional(object({<br>      allowed_origins     = optional(list(string))<br>      support_credentials = optional(bool, false)<br>    }))<br>    identity = object({<br>      type = string<br>    })<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Linux Function App. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Linux Function App. |
<!-- END_TF_DOCS -->