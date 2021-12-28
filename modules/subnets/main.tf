resource "azurerm_subnet" "subnet" {
  count = var.subnet_count
  name                 = "${var.name}-${format("%02d", count.index + 1)}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name[count.index]
  address_prefixes     = var.address_space
  enforce_private_link_service_network_policies = true
}