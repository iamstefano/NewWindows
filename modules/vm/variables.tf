variable "resource_group_name"{}
    
variable "resource_group_location" {}

variable "vm_name" {}

variable "vm_size" {}

variable "vm_username" {}

variable "vm_password" {}

variable "os_disk_storage_account_type" {}

variable "image_publisher" {}

variable "image_offer" {}

variable "image_sku" {}

variable "image_version" {}

variable "network_interface_id" {
  description = "ID dell'interfaccia di rete"
  type        = string
}
