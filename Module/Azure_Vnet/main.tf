
resource "azurerm_virtual_network" "example" {

 for_each = var.vnets

  name                = each.value.name                # (Required) Virtual Network name
  resource_group_name = each.value.resource_group_name # (Required) Resource Group name
  location            = each.value.location           # (Required) Azure region
  address_space       = each.value.address_space                  # Optional if ip_address_pool used
  # dns_servers                    = each.value.dns_servers                    # Optional custom DNS servers
  # edge_zone                      = each.value.edge_zone                      # Optional Edge Zone
  # flow_timeout_in_minutes        = each.value.flow_timeout_in_minutes        # Optional TCP flow timeout
  # bgp_community                  = each.value.bgp_community                  # Optional BGP community value
  # private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies # Optional (Defaults to Disabled)
  # tags = {
  #   environment = each.value.tags.environment
  #   owner       = each.value.tags.owner
  # }

  # ## 🔹 DDoS Protection Plan block
  # ddos_protection_plan {
  #   id     = each.value.ddos_protection_plan.id     # (Required inside block)
  #   enable = each.value.ddos_protection_plan.enable # (Required inside block)
  # }

  # ## 🔹 Encryption block
  # encryption {
  #   enforcement = each.value.encryption.enforcement # (Required inside block)
  # }

  dynamic "subnet" {
    for_each = each.value.subnet
    content {
      name             = subnet.value.name             # (Required inside block)
      address_prefixes = subnet.value.address_prefixes # (Required inside block)
      
      #route_table_id   = subnet.value.route_table_id   # (Optional)
      # default_outbound_access_enabled               = subnet.value.default_outbound_access_enabled
      # private_endpoint_network_policies             = subnet.value.private_endpoint_network_policies
      # private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled
      # service_endpoints                             = subnet.value.service_endpoints
    }


    # # Delegation block inside Subnet
    # delegation {
    #   name = "example-delegation"                             # (Required)

    #   service_delegation {
    #     name    = "Microsoft.ContainerInstance/containerGroups" # (Required)
    #     actions = [                                            # (Optional)
    #       "Microsoft.Network/virtualNetworks/subnets/action",
    #       "Microsoft.Network/virtualNetworks/subnets/join/action"
    #     ]
    #   }
    # }
  }

}
