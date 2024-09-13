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
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | List of access policies for the Key Vault. Each entry in the list is an object with the following attributes:<br>    - object\_id: The ID of the object (user, group, service principal, or managed identity) to which the access policy will be applied.<br>    - key\_permissions: (Optional) A list of permissions that apply to keys. Permissions can include 'get', 'list', 'delete', 'create', 'import', 'update', 'manage', 'recover', 'backup', 'restore', 'decrypt', 'encrypt', 'unwrapKey', 'wrapKey', 'verify', 'sign', 'purge'.<br>    - secret\_permissions: (Optional) A list of permissions that apply to secrets. Permissions can include 'get', 'list', 'set', 'delete', 'backup', 'restore', 'recover', 'purge'.<br>    - certificate\_permissions: (Optional) A list of permissions that apply to certificates. Permissions can include 'get', 'list', 'delete', 'create', 'import', 'update', 'managecontacts', 'getissuers', 'listissuers', 'setissuers', 'deleteissuers', 'manageissuers', 'recover', 'backup', 'restore', 'purge'.<br>    - storage\_permissions: (Optional) A list of permissions that apply to storage accounts. Permissions can include 'get', 'list', 'delete', 'set', 'update', 'regeneratekey', 'recover', 'backup', 'restore', 'setsas', 'listsas', 'getsas', 'deletesas'. | <pre>list(object({<br>    object_id               = string<br>    key_permissions         = optional(list(string))<br>    secret_permissions      = optional(list(string))<br>    certificate_permissions = optional(list(string))<br>    storage_permissions     = optional(list(string))<br>  }))</pre> | `[]` | no |
| <a name="input_config"></a> [config](#input\_config) | Configuration for the Key Vault with the following attributes:<br>    - `name`: The name of the Key Vault.<br>    - `sku_name`: The SKU name for the Key Vault, such as 'standard' or 'premium'.<br>    - `public_network_access_enabled`: (Optional) A boolean value indicating whether public network access is enabled for the Key Vault.<br>    - `soft_delete_retention_days`: (Optional) The number of days that items should be retained in the soft-delete state.<br>    - `purge_protection_enabled`: (Optional) A boolean value indicating whether purge protection is enabled for the Key Vault.<br>    - `enable_rbac_authorization`: (Optional) A boolean value indicating whether RBAC authorization is enabled for the Key Vault.<br>    - `network_acls`: (Optional) A block for the network ACL configurations.<br>      - `default_action`: The default action to apply when no other rules match.<br>      - `bypass`: Specifies whether traffic is bypassed for logging/metrics/azure services.<br>      - `virtual_network_subnet_ids`: (Optional) A list of subnet IDs for the virtual network. | <pre>object({<br>    name                          = string<br>    sku_name                      = string<br>    public_network_access_enabled = optional(bool)<br>    soft_delete_retention_days    = optional(number)<br>    purge_protection_enabled      = optional(bool)<br>    enable_rbac_authorization     = optional(bool)<br>    network_acls = optional(object({<br>      default_action             = string<br>      bypass                     = optional(list(string), ["AzureServices"])<br>      virtual_network_subnet_ids = optional(list(string))<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the Azure resource is created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Azure resource. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Key Vault. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Key Vault. |
<!-- END_TF_DOCS -->