resource "azurerm_subnet" "Subnet1" {
  
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtualNetworks_name
  address_prefixes     = var.address_prefixes
}