variable "azurerm_resource_group" {
  type = string
  default = "resource_aks"
}

variable "azurerm_resource_group_location" {
  type = string
  default = "East Asia"
}

variable "azurerm_virtual_network" {
  type = string
  default = "aks_vnet"
}
variable "azurerm_virtual_network_range" {
  type = list(string)
  default = ["11.0.0.0/16"]
}
variable "azurerm_sub_network" {
  type = string
  default = "subnet-1"
}
variable "azurerm_sub_network_range" {
  type = list(string)
  default = ["11.0.0.0/24"]
}

variable "azurerm_subnet_network" {
  type = string
  default = "subnet-2"
}
variable "azurerm_subnet_network_range" {
  type = list(string)
  default = ["11.0.1.0/24"]
}

variable "azurerm_cluster_name" {
  type = string
  default = "Aksclustertf"
}

variable "azurerm_node_count" {
  type = number
  default = 1
}

variable "azurerm_vm_size" {
    type = string
    default = "Standard_DS2_v2"
}