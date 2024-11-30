resource "azurerm_windows_virtual_machine" "myterraformvm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.vm_size
  admin_username      = var.vm_username
  admin_password      = var.vm_password
  network_interface_ids = [var.network_interface_id]  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}
