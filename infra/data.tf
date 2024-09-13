data "azurerm_subscription" "current" {}

data "azurerm_key_vault_secret" "app_insights_connection_string" {
  name         = "AppInsightsConnectionString"
  key_vault_id = module.key_vault.id
}