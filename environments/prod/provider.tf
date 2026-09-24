terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "4.80.0"
      }
    }
    backend "azurerm" {
      resource_group_name = "rg-yogesh"
      storage_account_name = "stgyogesh"
      container_name = "yogesh"
      key = "dev.tfstate"
    }
}