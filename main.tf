module "vnet" {
  source = "./modules/virtualNetworks"
  name   = "vnet-${var.team}-${terraform.workspace}-${lower(replace(var.location, "/ /", ""))}"
}

module "subnet" {
  source     = "./modules/subnets"
  name       = "snet-${var.team}-${terraform.workspace}-${lower(replace(var.location, "/ /", ""))}"
  vnet_name  = keys(module.vnet.vnet_names)
  depends_on = [module.vnet]
}

module "storage_accounts" {
  source         = "./modules/storageAccounts"
  name           = "st${var.team}storage"
  container_name = var.container_name
}

module "private_endpoint" {
  source             = "./modules/privateendPoints"
  subnet_id          = keys(module.subnet.subnet_ids)
  storage_account_id = keys(module.storage_accounts.storage_account_ids)
  depends_on         = [module.subnet, module.storage_accounts]
}

module "keyVault" {
  source         = "./modules/keyVault"
  key_vault_name = "kvs-${var.team}"
  depends_on = [module.storage_accounts]
}

module "keyVaultSecret" {
  source         = "./modules/keyVaultSecret"
  key_vault_secret_name = "kvs-${var.team}"
  value = keys(module.storage_accounts.sas_url_query_string)
  key_vault_id = keys(module.keyVault.key_vault_ids)
  depends_on = [module.keyVault]
}