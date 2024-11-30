# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.99.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "myterraformgroup" {
  name     = var.resource_group_name
  location = var.resource_group_location
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
    depends_on = [azurerm_resource_group.myterraformgroup] 
}

module "vm" {
    source = "./modules/vm"
    resource_group_name = var.resource_group_name          
    resource_group_location = var.resource_group_location  
    vm_name = var.vm_name
    vm_size = var.vm_size
    vm_username = var.vm_username
    vm_password = var.vm_password
    os_disk_storage_account_type = var.os_disk_storage_account_type
    image_publisher = var.image_publisher
    image_offer = var.image_offer
    image_sku = var.image_sku
    image_version = var.image_version
    network_interface_id = module.rete.network_interface_id
    depends_on = [module.rete] 
}


#Export public IP By Cosimo
/* data "azurerm_public_ip" "myterraformpublicip" {
  name                = azurerm_public_ip.myterraformpublicip.name
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_windows_virtual_machine.myterraformvm]
} */

/* output "public_ip_address" {
  value = module.rete.public_ip_address.ip_address
} */




/* codice esportato nei moduli*/

/* resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = "myVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "australiaeast"
  resource_group_name = azurerm_resource_group.myterraformgroup.name
}

resource "azurerm_subnet" "myterraformsubnet" {
  name                 = "mySubnet"
  resource_group_name  = azurerm_resource_group.myterraformgroup.name
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = "australiaeast"
    resource_group_name          = azurerm_resource_group.myterraformgroup.name
    allocation_method            = "Dynamic"

}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
    name                = "myNetworkSecurityGroup"
    location            = "australiaeast"
    resource_group_name = azurerm_resource_group.myterraformgroup.name

    security_rule {
        name                       = "AllowRDP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

}

resource "azurerm_network_interface" "myterraformnic" {
  name                = "myNIC"
  location            = "australiaeast"
  resource_group_name = azurerm_resource_group.myterraformgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.myterraformsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.myterraformnic.id
  network_security_group_id = azurerm_network_security_group.myterraformnsg.id
} */

/* resource "azurerm_windows_virtual_machine" "myterraformvm" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  location            = azurerm_resource_group.myterraformgroup.location
  size                = "Standard_B1s"
  admin_username      = "stefanostefano"
  admin_password      = "StefanoAre140488_"
  network_interface_ids = [
    azurerm_network_interface.myterraformnic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
} */