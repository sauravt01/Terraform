resource "azurerm_virtual_network" "example" {
  
  name                = var.azure_vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}







