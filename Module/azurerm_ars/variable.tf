variable "vaults" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    sku                        = string
    public_network_access_enabled = bool
    immutability               = string
    storage_mode_type          = string
    cross_region_restore_enabled = bool
    soft_delete_enabled        = bool

    encryption = optional(object({
      identity      = string
      key_vault_id  = string
      key_uri       = string
    }))
  }))
}
