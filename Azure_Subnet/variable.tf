variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string

  
}

variable "location" {
    description = "The Azure region where the subnet will be created."
    type        = string
    
  
}
variable "virtualNetworks_name" {
    description = "The name of the virtual network to which the subnet will be added."
    type        = string
  
}
variable "subnet_name" {
    description = "The name of the subnet to create."
    type        = string
  
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)  
}