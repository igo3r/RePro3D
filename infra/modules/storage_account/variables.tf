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
  Configuration for the Azure Storage Account.
  - `name`: The name of the Azure Storage Account. This is the unique name that identifies the storage account within the Azure subscription.
  - `account_kind`: The kind of storage account (e.g., StorageV2, BlobStorage, etc.).
  - `account_tier`: The performance tier of the storage account (e.g., Standard, Premium, etc.).
  - `account_replication_type`: The replication type of the storage account (e.g., LRS, GRS, ZRS, etc.).
  - `access_tier`: (Optional) The access tier of the storage account (e.g., Hot, Cool, etc.).
  - `allow_nested_items_to_be_public`: (Optional) Specifies whether nested items within this storage account can be public.
  - `cross_tenant_replication_enabled`: (Optional) Specifies whether cross-tenant replication is enabled.
  - `shared_access_key_enabled`: (Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests must be authorized with Entra ID. Defaults to true.
  - `default_to_oauth_authentication`: (Optional) Specifies whether the storage account defaults to OAuth authentication.
  - `enable_https_traffic_only`: (Optional) Specifies whether only HTTPS traffic is allowed to the storage account.
  - `public_network_access_enabled`: (Optional) Specifies whether public network access is enabled for the storage account.
  - `network_rules`: (Optional) Configuration for network rules, including default action, bypass, IP rules, virtual network subnet IDs, and private link access.
  EOF
  type = object({
    name                             = string
    account_kind                     = string
    account_tier                     = string
    account_replication_type         = string
    access_tier                      = optional(string, "Hot")
    allow_nested_items_to_be_public  = optional(bool, true)
    cross_tenant_replication_enabled = optional(bool, true)
    shared_access_key_enabled        = optional(bool, true)
    default_to_oauth_authentication  = optional(bool, false)
    enable_https_traffic_only        = optional(bool, true)
    public_network_access_enabled    = optional(bool, true)
    network_rules = optional(object({
      default_action             = string
      bypass                     = optional(list(string), ["AzureServices"])
      ip_rules                   = optional(list(string))
      virtual_network_subnet_ids = optional(list(string))
    }))
  })
}