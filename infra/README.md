<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.107.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application_insights"></a> [application\_insights](#module\_application\_insights) | ./modules/application_insights | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ./modules/key_vault | n/a |
| <a name="module_linux_function_app"></a> [linux\_function\_app](#module\_linux\_function\_app) | ./modules/linux_function_app | n/a |
| <a name="module_log_analytics_workspace"></a> [log\_analytics\_workspace](#module\_log\_analytics\_workspace) | ./modules/log_analytics_workspace | n/a |
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | 0.4.0 |
| <a name="module_role_assignments"></a> [role\_assignments](#module\_role\_assignments) | ./modules/role_assignment | n/a |
| <a name="module_service_plan"></a> [service\_plan](#module\_service\_plan) | ./modules/service_plan | n/a |
| <a name="module_storage_account_function_app"></a> [storage\_account\_function\_app](#module\_storage\_account\_function\_app) | ./modules/storage_account | n/a |
| <a name="module_storage_account_print_files"></a> [storage\_account\_print\_files](#module\_storage\_account\_print\_files) | ./modules/storage_account | n/a |
| <a name="module_storage_container_print_files"></a> [storage\_container\_print\_files](#module\_storage\_container\_print\_files) | ./modules/storage_container | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_key_vault_secret.app_insights_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->