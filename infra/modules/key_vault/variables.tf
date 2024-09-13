variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure resource."
  type        = string
}

variable "location" {
  description = "The location/region where the Azure resource is created."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "config" {
  description = <<EOF
  Configuration for the Key Vault with the following attributes:
    - `name`: The name of the Key Vault.
    - `sku_name`: The SKU name for the Key Vault, such as 'standard' or 'premium'.
    - `public_network_access_enabled`: (Optional) A boolean value indicating whether public network access is enabled for the Key Vault.
    - `soft_delete_retention_days`: (Optional) The number of days that items should be retained in the soft-delete state.
    - `purge_protection_enabled`: (Optional) A boolean value indicating whether purge protection is enabled for the Key Vault.
    - `enable_rbac_authorization`: (Optional) A boolean value indicating whether RBAC authorization is enabled for the Key Vault.
    - `network_acls`: (Optional) A block for the network ACL configurations.
      - `default_action`: The default action to apply when no other rules match.
      - `bypass`: Specifies whether traffic is bypassed for logging/metrics/azure services.
      - `virtual_network_subnet_ids`: (Optional) A list of subnet IDs for the virtual network.
  EOF
  type = object({
    name                          = string
    sku_name                      = string
    public_network_access_enabled = optional(bool)
    soft_delete_retention_days    = optional(number)
    purge_protection_enabled      = optional(bool)
    enable_rbac_authorization     = optional(bool)
    network_acls = optional(object({
      default_action             = string
      bypass                     = optional(list(string), ["AzureServices"])
      virtual_network_subnet_ids = optional(list(string))
    }))
  })
}

variable "access_policies" {
  description = <<EOF
  List of access policies for the Key Vault. Each entry in the list is an object with the following attributes:
    - object_id: The ID of the object (user, group, service principal, or managed identity) to which the access policy will be applied.
    - key_permissions: (Optional) A list of permissions that apply to keys. Permissions can include 'get', 'list', 'delete', 'create', 'import', 'update', 'manage', 'recover', 'backup', 'restore', 'decrypt', 'encrypt', 'unwrapKey', 'wrapKey', 'verify', 'sign', 'purge'.
    - secret_permissions: (Optional) A list of permissions that apply to secrets. Permissions can include 'get', 'list', 'set', 'delete', 'backup', 'restore', 'recover', 'purge'.
    - certificate_permissions: (Optional) A list of permissions that apply to certificates. Permissions can include 'get', 'list', 'delete', 'create', 'import', 'update', 'managecontacts', 'getissuers', 'listissuers', 'setissuers', 'deleteissuers', 'manageissuers', 'recover', 'backup', 'restore', 'purge'.
    - storage_permissions: (Optional) A list of permissions that apply to storage accounts. Permissions can include 'get', 'list', 'delete', 'set', 'update', 'regeneratekey', 'recover', 'backup', 'restore', 'setsas', 'listsas', 'getsas', 'deletesas'.
  EOF
  type = list(object({
    object_id               = string
    key_permissions         = optional(list(string))
    secret_permissions      = optional(list(string))
    certificate_permissions = optional(list(string))
    storage_permissions     = optional(list(string))
  }))
  default = []
}