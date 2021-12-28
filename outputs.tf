output "vnet_names" {
  value = module.vnet.vnet_names
}

output "subnet_ids" {
  value = module.subnet.subnet_ids
}

output "storage_account_ids" {
  value = module.storage_accounts.storage_account_ids
}