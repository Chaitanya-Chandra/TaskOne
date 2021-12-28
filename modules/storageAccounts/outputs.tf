output "storage_account_ids" {
  value = {
    for storage_account in azurerm_storage_account.storage_account :
    storage_account.id => storage_account.name
  }
}


output "sas_url_query_string" {
  value = {
  for staccount_sas in data.azurerm_storage_account_sas.sas_token :
  staccount_sas.sas => staccount_sas.signed_version
  }
}