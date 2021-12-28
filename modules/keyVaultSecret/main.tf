resource "azurerm_key_vault_secret" "secret" {
  count = var.secret_count
  name         = "${var.key_vault_secret_name}-${format("%02d", count.index + 1)}"
  value        = var.value[count.index]
  key_vault_id = var.key_vault_id[count.index]
}