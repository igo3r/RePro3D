terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "terraformrepro3d"
    container_name       = "tf-state"
    key                  = "terraform.tfstate"
  }
}