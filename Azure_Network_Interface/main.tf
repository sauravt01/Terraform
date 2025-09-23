resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "pip-config"
    subnet_id                    = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"  
    public_ip_address_id = data.azurerm_public_ip.public_ip.id
  }
}