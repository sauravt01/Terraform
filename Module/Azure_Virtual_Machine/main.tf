resource "azurerm_public_ip" "ip" {

  for_each = var.vms
  name                = each.value.ip_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = "Static"

}

resource "azurerm_network_interface" "main" {

    for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  

  dynamic "ip_configuration" {

    for_each = each.value.ip_config_name

content {
    name                          = ip_configuration.value.name 
    subnet_id                     = data.azurerm_subnet.subnets[each.key].id
    private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.ip[each.key].id
    
}
}
}
resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc" {
  for_each = var.vms

  network_interface_id      = azurerm_network_interface.main[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsgs[each.key].id
}


resource "azurerm_virtual_machine" "main" {
    for_each = var.vms  
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
  vm_size               = each.value.vm_size

 
  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  
  }
  storage_os_disk {
    name              = each.value.name 
    caching           = each.value.caching   
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.computer_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = each.value.disable_password_authentication
  }
}