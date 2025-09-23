resource "azurerm_public_ip" "example" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  allocation_method   = "Static"
}