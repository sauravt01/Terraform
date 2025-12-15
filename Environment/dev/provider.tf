terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg1234"
    storage_account_name = "storageaccount9454"
    container_name       = "tfstate"
    key                  = "terraform-dev-tfstate"
  }
}


provider "azurerm" {
  # Configuration options
  features {
  }
  subscription_id = "acd9510d-7e29-433d-8504-d10d34dba654"

}
