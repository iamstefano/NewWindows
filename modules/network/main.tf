resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "myterraformsubnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = var.resource_group_location
    resource_group_name          = var.resource_group_name
    allocation_method            = "Dynamic"

}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
    name                = var.networksecuritygroup_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name

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
  name                = var.netinterface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

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
}