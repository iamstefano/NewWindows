# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.10.0"
    }
  }
}

provider "azurerm" {
  
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id= "3fbf8c25-42c1-4347-b310-6642844443e8"
}

#!!!Commentato perchè il rgroup è già creato con il key vault!!!
/* resource "azurerm_resource_group" "myterraformgroup" {
  name     = var.resource_group_name
  location = var.resource_group_location
} */

# Use this data source to access the configuration of the AzureRM provider.
data "azurerm_client_config" "current" {}
# azurerm_key_vault

data "azurerm_resource_group" "example" {
  name = "sa-keyvault777-rg"
}

data "azurerm_key_vault" "example" {
  name                = var.keyVaultName
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.example.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.example.id
}

module "rete" {
    source = "./modules/network"
    resource_group_name = var.resource_group_name          
    resource_group_location = var.resource_group_location 
    vnet_name = var.vnet_name 
    pip_name = var.pip_name
    subnet_name = var.subnet_name
    networksecuritygroup_name = var.networksecuritygroup_name
    netinterface_name = var.netinterface_name
    depends_on = [data.azurerm_resource_group.example] 
}

module "vm" {
    source = "./modules/vm"
    resource_group_name = var.resource_group_name          
    resource_group_location = var.resource_group_location  
    vm_name = var.vm_name
    vm_size = var.vm_size
    vm_username = data.azurerm_key_vault_secret.username.value
    vm_password = data.azurerm_key_vault_secret.password.value
    os_disk_storage_account_type = var.os_disk_storage_account_type
    image_publisher = var.image_publisher
    image_offer = var.image_offer
    image_sku = var.image_sku
    image_version = var.image_version
    network_interface_id = module.rete.network_interface_id
    depends_on = [module.rete] 
}

