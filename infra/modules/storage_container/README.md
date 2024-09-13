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
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | Configuration for the Azure Storage Container.<br>  `container_name`: The name of the Azure Storage Container. This is the unique name that identifies the container within the storage account.<br>  `storage_account_name`: The name of the Azure Storage Account where the container will be created. This is the name of the storage account resource in Azure.<br>  `container_access_type`: The access type for the container. This can be one of the following values:<br>    - "private": The container and its blobs can only be accessed by the storage account owner.<br>    - "blob": The container and its blobs can be accessed anonymously over the Internet.<br>    - "container": The container can be listed anonymously over the Internet, but access to the blobs is restricted to the storage account owner. | <pre>object({<br>    container_name        = string<br>    storage_account_name  = string<br>    container_access_type = optional(string)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of the Storage Container. |
<!-- END_TF_DOCS -->