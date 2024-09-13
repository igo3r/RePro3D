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
| [azurerm_service_plan.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | App Service Plan configuration | <pre>object({<br>    name                   = string<br>    os_type                = string<br>    sku_name               = string<br>    zone_balancing_enabled = optional(bool, false)<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where the resources are deployed to | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the Resource Group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | This Object is used to store information about the running deployment. Resources will be tagged with it | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Service Plan. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Service Plan. |
<!-- END_TF_DOCS -->