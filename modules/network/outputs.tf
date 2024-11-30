output "public_ip_address" {
  value = azurerm_public_ip.myterraformpublicip.ip_address
}

output "network_interface_id" {
  value = azurerm_network_interface.myterraformnic.id
}

/* output "public_ip_address" {
  value = data.azurerm_public_ip.myterraformpublicip.ip_address
} */