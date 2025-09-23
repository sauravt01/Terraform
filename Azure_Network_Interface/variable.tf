variable "resource_group_name" {
 description = "The name of the resource group"
    type        = string
}

variable "location" {
 description = "The location of the resource group"
    type        = string
  
}
variable "nic_name" {
 description = "The name of the Network Interface"
    type        = string
  
}
variable "subnet_name" {
 description = "The name of the Subnet"
    type        = string
  
}
variable "virtualNetworks_name" {
  description = "The name of the  Vnet"
    type        = string
}
variable "pip_name" {
 description = "The name of the Public IP"
    type        = string
  
}