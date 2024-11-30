variable "resource_group_name"{}
    
variable "resource_group_location" {}


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