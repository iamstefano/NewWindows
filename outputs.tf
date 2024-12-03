output "my_public_ip" {
  value = module.rete.public_ip_address
}

output "retrieved_username" {
  value     = data.azurerm_key_vault_secret.username.value
  sensitive = true
}

output "retrieved_password" {
  value     = data.azurerm_key_vault_secret.password.value
  sensitive = true
}