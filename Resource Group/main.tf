terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.30.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
  subscription_id = "2c68ed43-5abc-4e76-a2f4-b6b3f86d6b04"
}


resource "azurerm_resource_group" "rg123" {
  name     = "Saurav_rg123"
  location = "West US"
}


resource "azurerm_storage_account" "example1" {
  name = "backendstorageaccount1"

  #Implicit dependencies
  resource_group_name      = azurerm_resource_group.rg2.name
  location                 = azurerm_resource_group.rg2.location

  account_tier             = "Standard"
  account_replication_type = "GRS"
}


