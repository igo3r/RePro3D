resource "azurerm_key_vault" "this" {
  name                          = var.config.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.config.sku_name
  public_network_access_enabled = var.config.public_network_access_enabled
  soft_delete_retention_days    = var.config.soft_delete_retention_days
  purge_protection_enabled      = var.config.purge_protection_enabled
  enable_rbac_authorization     = var.config.enable_rbac_authorization
  tags                          = var.tags

  dynamic "network_acls" {
    for_each = var.config.network_acls != null ? [var.config.network_acls] : []
    content {
      default_action             = network_acls.value.default_action
      bypass                     = network_acls.value.bypass
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }

  dynamic "access_policy" {
    for_each = var.access_policies
    content {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = access_policy.value.object_id
      key_permissions         = access_policy.value.key_permissions
      secret_permissions      = access_policy.value.secret_permissions
      certificate_permissions = access_policy.value.certificate_permissions
      storage_permissions     = access_policy.value.storage_permissions
    }
  }
}