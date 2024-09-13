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
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments) | Map of role assignments | <pre>map(list(object({<br>    scope                            = string<br>    roles                            = list(string)<br>    skip_service_principal_aad_check = optional(bool, false)<br>  })))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->