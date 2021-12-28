output "storage_account_ids" {
  value = {
    for storage_account in azurerm_storage_account.storage_account :
    storage_account.id => storage_account.name
  }
}