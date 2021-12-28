resource "azurerm_private_dns_zone" "private_dns" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_endpoint" "pe_blob" {
  count               = var.nodes
  name                = "anblicks_private_endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id[count.index]

  private_service_connection {
    name                           = "anblicks_service_connection"
    is_manual_connection           = false
    private_connection_resource_id = var.storage_account_id[count.index]
    subresource_names              = ["blob"]
  }
  private_dns_zone_group {
    name                 = azurerm_private_dns_zone.private_dns.name
    private_dns_zone_ids = [azurerm_private_dns_zone.private_dns.id]
  }
}