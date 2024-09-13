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
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | Configuration for the Azure Storage Account.<br>  - `name`: The name of the Azure Storage Account. This is the unique name that identifies the storage account within the Azure subscription.<br>  - `account_kind`: The kind of storage account (e.g., StorageV2, BlobStorage, etc.).<br>  - `account_tier`: The performance tier of the storage account (e.g., Standard, Premium, etc.).<br>  - `account_replication_type`: The replication type of the storage account (e.g., LRS, GRS, ZRS, etc.).<br>  - `access_tier`: (Optional) The access tier of the storage account (e.g., Hot, Cool, etc.).<br>  - `allow_nested_items_to_be_public`: (Optional) Specifies whether nested items within this storage account can be public.<br>  - `cross_tenant_replication_enabled`: (Optional) Specifies whether cross-tenant replication is enabled.<br>  - `shared_access_key_enabled`: (Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests must be authorized with Entra ID. Defaults to true.<br>  - `default_to_oauth_authentication`: (Optional) Specifies whether the storage account defaults to OAuth authentication.<br>  - `enable_https_traffic_only`: (Optional) Specifies whether only HTTPS traffic is allowed to the storage account.<br>  - `public_network_access_enabled`: (Optional) Specifies whether public network access is enabled for the storage account.<br>  - `network_rules`: (Optional) Configuration for network rules, including default action, bypass, IP rules, virtual network subnet IDs, and private link access. | <pre>object({<br>    name                             = string<br>    account_kind                     = string<br>    account_tier                     = string<br>    account_replication_type         = string<br>    access_tier                      = optional(string, "Hot")<br>    allow_nested_items_to_be_public  = optional(bool, true)<br>    cross_tenant_replication_enabled = optional(bool, true)<br>    shared_access_key_enabled        = optional(bool, true)<br>    default_to_oauth_authentication  = optional(bool, false)<br>    enable_https_traffic_only        = optional(bool, true)<br>    public_network_access_enabled    = optional(bool, true)<br>    network_rules = optional(object({<br>      default_action             = string<br>      bypass                     = optional(list(string), ["AzureServices"])<br>      ip_rules                   = optional(list(string))<br>      virtual_network_subnet_ids = optional(list(string))<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the Azure resource is created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Azure resource. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Storage Account. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Storage Account. |
<!-- END_TF_DOCS -->