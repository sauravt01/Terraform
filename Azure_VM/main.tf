resource "azurerm_linux_virtual_machine" "frontEnd-vm" {

  name                = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B2ms"

  admin_username      = var.admin_username
  network_interface_ids = [
    data.azurerm_network_interface.nic.id,
  
  ]

  admin_password = var.admin_password
  disable_password_authentication = false

  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}