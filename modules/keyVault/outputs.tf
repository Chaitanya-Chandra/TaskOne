output "key_vault_ids" {
  value = {
  for key_vault in azurerm_key_vault.key_vault :
  key_vault.id => key_vault.name
  }
}
