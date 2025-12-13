data "azurerm_key_vault" "kv" {
  for_each = var.servers
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "kvs" {
    for_each = var.servers

  name         = each.value.secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
data "azurerm_key_vault_secret" "kvsp" {
    for_each = var.servers

  name         = each.value.secret_password_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
resource "azurerm_mssql_server" "mysql_server" {

  for_each = var.servers
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.kvs[each.key].value 
  administrator_login_password = data.azurerm_key_vault_secret.kvsp[each.key].value
  minimum_tls_version          = each.value.minimum_tls_version
  public_network_access_enabled = true
  
}