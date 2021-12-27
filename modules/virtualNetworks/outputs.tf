output "vnet_names" {
  value = azurerm_virtual_network.vnet.*.name
}