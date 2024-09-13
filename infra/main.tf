### Naming
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.0"
  suffix  = ["${local.project_name}"]
}


### Resource Group
resource "azurerm_resource_group" "this" {
  name     = local.project_name
  location = local.location
}


### Monitoring
module "log_analytics_workspace" {
  source = "./modules/log_analytics_workspace"

  resource_group_name = azurerm_resource_group.this.name
  location            = local.location
  config = {
    name = "${module.naming.log_analytics_workspace.name}"
  }
}


### Storage Account
module "storage_account_print_files" {
  source = "./modules/storage_account"

  resource_group_name = azurerm_resource_group.this.name
  location            = local.location

  config = {
    name                             = "${local.project_name}"
    account_kind                     = "StorageV2"
    account_tier                     = "Standard"
    account_replication_type         = "LRS"
    allow_nested_items_to_be_public  = false
    cross_tenant_replication_enabled = false
    shared_access_key_enabled        = true
    default_to_oauth_authentication  = false
    public_network_access_enabled    = true
  }
}

module "storage_container_print_files" {
  source = "./modules/storage_container"

  config = {
    storage_account_name  = module.storage_account_print_files.name
    container_name        = "prusa-mk4"
    container_access_type = "private"
  }
}


### Key Vault
module "key_vault" {
  source = "./modules/key_vault"

  resource_group_name = azurerm_resource_group.this.name
  location            = local.location

  config = {
    name                          = "${module.naming.key_vault.name}"
    sku_name                      = "standard"
    public_network_access_enabled = true
    soft_delete_retention_days    = "7"
    purge_protection_enabled      = true
    enable_rbac_authorization     = true
  }
}


## Function Apps
module "service_plan" {
  source = "./modules/service_plan"

  resource_group_name = azurerm_resource_group.this.name
  location            = local.location

  config = {
    name     = "${local.project_name}-asp"
    os_type  = "Linux"
    sku_name = "S1"
  }
}

module "storage_account_function_app" {
  source = "./modules/storage_account"

  resource_group_name = azurerm_resource_group.this.name
  location            = local.location

  config = {
    name                             = "${local.project_name}function"
    account_kind                     = "StorageV2"
    account_tier                     = "Standard"
    account_replication_type         = "LRS"
    allow_nested_items_to_be_public  = false
    cross_tenant_replication_enabled = false
    shared_access_key_enabled        = true
    default_to_oauth_authentication  = false
    public_network_access_enabled    = true
  }
}

module "application_insights" {
  source = "./modules/application_insights"

  resource_group_name = azurerm_resource_group.this.name
  location            = local.location
  config = {
    name             = "${module.naming.application_insights.name}"
    application_type = "other"
    workspace_id     = module.log_analytics_workspace.id
  }
}

module "linux_function_app" {
  source = "./modules/linux_function_app"

  config = {
    name                          = "${local.project_name}"
    resource_group_name           = azurerm_resource_group.this.name
    location                      = local.location
    storage_account_name          = module.storage_account_function_app.name
    storage_uses_managed_identity = true
    service_plan_id               = module.service_plan.id
    https_only                    = true
    site_config = {
      always_on                              = true
      http2_enabled                          = true
      application_insights_connection_string = data.azurerm_key_vault_secret.app_insights_connection_string.value
    }
    application_stack = {
      python_version = "3.9"
    }
    cors = {
      allowed_origins = local.cors_allowed_origins
    }
    identity = {
      type = "SystemAssigned"
    }
  }
}