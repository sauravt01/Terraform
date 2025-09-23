data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtualNetworks_name
  resource_group_name  = var.resource_group_name
}
data "azurerm_public_ip" "public_ip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
}
