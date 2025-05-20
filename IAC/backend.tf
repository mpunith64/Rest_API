terraform {
  backend "azurerm" {
    resource_group_name  = "myResourceGroup"
    storage_account_name = "gactfstatedemo"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}