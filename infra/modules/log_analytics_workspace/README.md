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
| [azurerm_log_analytics_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | Configuration for the Log Analytics Workspace with the following attributes:<br>    - `name`: Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol.<br>    - `sku`: (Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018. Defaults to PerGB2018.<br>    - `retention_in_days`: (Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. | <pre>object({<br>    name              = string<br>    sku               = optional(string, "PerGB2018")<br>    retention_in_days = optional(number, 30)<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the Azure resource is created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Azure resource. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Log Analytics Workspace. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Log Analytics Workspace. |
<!-- END_TF_DOCS -->