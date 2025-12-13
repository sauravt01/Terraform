resource "azurerm_recovery_services_vault" "vault" {
  for_each = var.vaults

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku

  # Optional Blocks
  public_network_access_enabled = each.value.public_network_access_enabled
  immutability                  = each.value.immutability
  storage_mode_type             = each.value.storage_mode_type
  cross_region_restore_enabled  = each.value.cross_region_restore_enabled
  soft_delete_enabled           = each.value.soft_delete_enabled

  # Encryption Block
#   dynamic "encryption" {
#     for_each = each.value.encryption == null ? [] : [each.value.encryption]

#     content {
#       identity = encryption.value.identity
#       key_vault_id = encryption.value.key_vault_id
#       key_uri      = encryption.value.key_uri
#     }
#   }
}