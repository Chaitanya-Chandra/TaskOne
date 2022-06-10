resource "azurerm_virtual_network" "vnet" {
  count               = var.vnet_count
  name                = "${var.name}-${format("%02d", count.index + 1)}"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}