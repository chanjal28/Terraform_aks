resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name = var.azurerm_cluster_name
  location = azurerm_resource_group.aks_resource.location
  resource_group_name = azurerm_resource_group.aks_resource.name
  private_cluster_enabled    = true
  dns_prefix = var.azurerm_cluster_name

  default_node_pool {
    name = "default"
    node_count = var.azurerm_node_count
    vm_size = var.azurerm_vm_size
#    min_count           = var.azurerm_node_count
#    max_count           = var.azurerm_node_count
    vnet_subnet_id = azurerm_subnet.aks_subnet_network.id

    enable_auto_scaling = false
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku  = "standard"
    network_policy = "azure"
    service_cidr   = "11.1.0.0/16"
    dns_service_ip = "11.1.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
 }

  identity {
    type = "SystemAssigned"

  }
}
