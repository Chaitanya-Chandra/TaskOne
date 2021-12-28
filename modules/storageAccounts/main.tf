// timeadd(timestamp(), "10h") dateadd() is not avaliable...
resource "time_offset" "expiry" {
  offset_years = 1
}

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

data "azurerm_storage_account_sas" "sas_token" {
  count = var.storage_account_count
  connection_string = azurerm_storage_account.storage_account[count.index].primary_connection_string
  https_only        = true
  signed_version    = "2017-07-29"

  resource_types {
    service   = true
    container = false
    object    = false
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = timestamp()
  expiry = time_offset.expiry.rfc3339

  permissions {
    read    = true
    write   = true
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = false
    process = false
  }
}