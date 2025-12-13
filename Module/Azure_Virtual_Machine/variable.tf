variable "vms" {
    type = map(object({
        nsg_name = string
        nic_name = string
        subnet_name = string
        ip_name = string
        vnet_name = string
        location = string
        rg_name =string
        vm_name= string
        vm_size = string     
        ip_config_name = map(object({   
            name = string
            private_ip_address_allocation = string
        }))
        publisher = string
        offer     = string
        sku       = string
        version   = string

        name              = string
        caching           = string  
        create_option     = string
        managed_disk_type = string
        computer_name  = string
    admin_username = string
    admin_password = string
    disable_password_authentication = bool

    })
    )
}