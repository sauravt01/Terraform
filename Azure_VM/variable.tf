variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
  
}

variable "location" {
  description = "The Azure region where the virtual machine will be created."
  type        = string
  
}

variable "virtual_network_name" {
  description = "The name of the virtual network to which the virtual machine will be connected."
  type        = string
  
}

variable admin_username{
  description = "The name of the subnet to which the virtual machine will be connected."
  type        = string
  
}
variable admin_password{
  description = "The password for the administrator account of the virtual machine."
  type        = string

}
variable "nic_name" {
  description = "The name of the network interface to be created."
  type        = string
  
}
variable "virtual_machine_name" {
  description = "The name of the virtual machine to be created."
  type        = string
  
}
variable "subnet_name" {
  description = "The name of the subnet to which the virtual machine will be connected."
  type        = string
  
}
