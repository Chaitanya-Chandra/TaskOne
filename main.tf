module "vnet" {
  source = "./modules/virtualNetworks"
  count = var.nodes
  name = "vnet-${var.team}-${terraform.workspace}-${lower(replace(var.location, "/ /", ""))}"
}

module "subnet" {
  source    = "./modules/subnets"
  count = length(module.vnet.vnet_names[*])
  name = "snet-${var.team}-${terraform.workspace}-${lower(replace(var.location, "/ /", ""))}"
  vnet_name = module.vnet.vnet_names[count.index]
}

module "storage_accounts" {
  source = "./modules/storageAccounts"
  name = "st${var.team}storage"
  container_name = var.container_name
}

module "private_endpoint" {
  source             = "./modules/privateendPoints"
  count = length(module.storage_accounts.storage_account_ids[*])
  subnet_id          = module.subnet.subnet_ids
  storage_account_id = module.storage_accounts.storage_account_ids[count.index]
}