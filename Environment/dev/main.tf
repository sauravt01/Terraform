

module "resource_group" {

  source = "../../Module/Azure_Resource_group"
  rgs    = asdfsaf
}
# Added new line 
#Added one more line 
#Added one more line 
# Added 2 line 

module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../Module/Azure_Vnet"
  vnets      = var.vnets
}

#nsg module
module "nsg" {
  depends_on = [module.resource_group]
  source     = "../../Module/azurerm_network_security_group"
  nsgs       = var.nsgs
}
module "vm" {
  depends_on = [module.vnet, module.resource_group, module.nsg]
  source     = "../../Module/Azure_Virtual_Machine"
  vms        = var.vms
}


# # key vault module
# module "key_vault" {

#   # depends_on = [module.resource_group]
#   source     = "../../Module/azurerm_key_vault"
#   keys_vault = var.keys_vault

# }
# # key vault secret module
# module "key_vault_secret" {

#   depends_on = [module.key_vault]
#   source     = "../../Module/azurerm_key_vault_secret"
#   secrets    = var.secrets

# }


# # module "sql_server" 
# module "sql_server" {
#   depends_on = [module.key_vault, module.key_vault_secret]
#   source     = "../../Module/azuerm_mssql_server"
#   servers = var.servers
# }




