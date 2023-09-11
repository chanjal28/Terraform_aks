resource "azurerm_resource_group" "aks_resource" {
  name = var.azurerm_resource_group
  location = var.azurerm_resource_group_location

}

resource "azurerm_virtual_network" "aks_network" {
  name = var.azurerm_virtual_network
  address_space = var.azurerm_virtual_network_range
  location = azurerm_resource_group.aks_resource.location
  resource_group_name = azurerm_resource_group.aks_resource.name
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.azurerm_sub_network
  resource_group_name  = azurerm_resource_group.aks_resource.name
  virtual_network_name = azurerm_virtual_network.aks_network.name
  address_prefixes     = var.azurerm_sub_network_range
}

resource "azurerm_subnet" "aks_subnet_network" {
  name                 = var.azurerm_subnet_network
  resource_group_name  = azurerm_resource_group.aks_resource.name
  virtual_network_name = azurerm_virtual_network.aks_network.name
  address_prefixes     = var.azurerm_subnet_network_range
}
