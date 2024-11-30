variable "resource_group_name"{}
    
variable "resource_group_location" {}

variable "vm_name" {
  default = "saVM"
  description = "Nome VM"
}

variable "vm_size" {
  default = "Standard_B2ms"
  description = "Modello size della VM"
}

variable "vm_username" {
  default = "stefanostefano"
  description = "Username VM"
}

variable "vm_password" {
  default = "StefanoAre140488_"
  description = "Password VM"
}

variable "os_disk_storage_account_type" {
  default = "Standard_LRS"
  description = "Tipo storage disk VM"
}

variable "image_publisher" {
  default = "MicrosoftWindowsServer"
  description = "Publisher immagine"
}

variable "image_offer" {
  default = "WindowsServer"
  description = "Tipo di immagine"
}

variable "image_sku" {
  default = "2016-Datacenter"
  description = "Sku immagine"
}

variable "image_version" {
  default = "latest"
  description = "Versione immagine"
}

variable "network_interface_id" {
  description = "ID dell'interfaccia di rete"
  type        = string
}
