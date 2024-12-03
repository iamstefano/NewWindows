variable "resource_group_name"{
    default = "sa-keyvault777-rg"
    description = "Nome gruppo risorse"
}

variable "resource_group_location" {
    default = "northeurope"
    description = "Locazione del gruppo di risorse"
}

/*NETWORK*/

variable "vnet_name" {
    default = "saVnet"
    description = "Nome Vnet"

}

variable "pip_name" {
    default = "saPublicIp01"
    description = "Indirizzo IP pubblico"
}

variable "subnet_name" {
  default = "saSubnet"
  description = "Nome subnet"
}

variable "networksecuritygroup_name" {
  default = "saNetSecGroup"
  description = "Nome gruppo sicurezza network"
}

variable "netinterface_name" {
  default = "saNetInterface"
  description = "Nome interfaccia network"
}

/*VM*/

variable "vm_name" {
  default = "saVM"
  description = "Nome VM"
}

variable "vm_size" {
  default = "Standard_B2ms"
  description = "Modello size della VM"
}

variable "vm_username" {
  default     = ""
  description = "Username VM"
  type        = string
}

variable "vm_password" {
  default     = ""
  description = "Password VM"
  type        = string
  sensitive   = true
}

variable "os_disk_storage_account_type" {
  default = "Standard_LRS"
  description = "Tipo storage disk VM"
}

variable "image_publisher" {
  default = "MicrosoftWindowsDesktop"
  description = "Publisher immagine"
}

variable "image_offer" {
  default = "Windows-10"
  description = "Tipo di immagine"
}

variable "image_sku" {
  default = "win10-21h2-avd"
  description = "Sku immagine"
}

variable "image_version" {
  default = "latest"
  description = "Versione immagine"
}

variable "keyVaultName" {
  type        = string
  default = "keyvault777-sa"
  description = "Nome Key Vault"
}