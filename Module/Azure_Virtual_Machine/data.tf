data "azurerm_network_security_group" "nsgs" {
    for_each = var.vms
  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
}
data "azurerm_subnet" "subnets" {
    for_each = var.vms

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}