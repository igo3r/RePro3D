resource "azurerm_storage_account" "this" {
  name                             = var.config.name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  tags                             = var.tags
  account_kind                     = var.config.account_kind
  account_tier                     = var.config.account_tier
  account_replication_type         = var.config.account_replication_type
  access_tier                      = var.config.access_tier
  allow_nested_items_to_be_public  = var.config.allow_nested_items_to_be_public
  cross_tenant_replication_enabled = var.config.cross_tenant_replication_enabled
  shared_access_key_enabled        = var.config.shared_access_key_enabled
  default_to_oauth_authentication  = var.config.default_to_oauth_authentication
  enable_https_traffic_only        = var.config.enable_https_traffic_only
  public_network_access_enabled    = var.config.public_network_access_enabled

  dynamic "network_rules" {
    for_each = var.config.network_rules != null ? [var.config.network_rules] : []
    content {
      default_action             = network_rules.value.default_action
      bypass                     = network_rules.value.bypass
      ip_rules                   = network_rules.value.ip_rules
      virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids
    }
  }
}