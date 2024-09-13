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
| [azurerm_application_insights.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | Configuration for the Log Analytics Workspace with the following attributes:<br>    - `name`: Specifies the name of the Application Insights component.<br>    - `application_type`: Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET.<br>    - `sampling_percentage`: (Optional) Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry. Defaults to 100.<br>    - `workspace_id`: (Optional) Specifies the id of a log analytics workspace resource. | <pre>object({<br>    name                = string<br>    application_type    = string<br>    sampling_percentage = optional(number, 100)<br>    workspace_id        = optional(string)<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the Azure resource is created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Azure resource. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->