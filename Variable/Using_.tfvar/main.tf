terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
    features {}
    subscription_id = "e2b21bd3-23b3-43c2-a854-a8c3e3fad269"

}


# resource group creation 
resource azurerm_resource_group "saurav_rg1" {

  name     =var.rg_name # using of variable
  location = var.rg_location # using of variable
}