variable "azure_vnet_name" {
  description = "The name of the Azure Virtual Network"
  type        = string
  
  
}

variable "resource_group_name" {
  description = "The name of the resource group where the virtual network will be created"
  type        = string
  
}

variable "location" {
  description = "The Azure region where the virtual network will be created"
  type        = string
  
}

variable "address_space" {
  description = "The address space for the virtual network in CIDR notation"
  type        = list(string)
  
}