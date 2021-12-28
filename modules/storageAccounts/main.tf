resource "azurerm_storage_account" "storage_account" {
  count                    = var.storage_account_count
  name                     = "${var.name}${format("%02d", count.index + 1)}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.repl_type
  is_hns_enabled           = var.datalake_v2
  min_tls_version          = var.tls_ver
}

resource "azurerm_storage_container" "blob" {
  count                 = var.storage_account_count
  name                  = "${var.container_name}-${format("%02d", count.index + 1)}"
  storage_account_name  = element(azurerm_storage_account.storage_account.*.name, count.index)
  container_access_type = "private"
}