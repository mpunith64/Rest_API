provider "azurerm" {
  features {}
  subscription_id = "44beb8fa-6219-4265-bbc9-1d73754f6b17"
}
resource "azurerm_resource_group" "rg" {
  name     = "my-resource-group"
  location = "West US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-demo"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2ms"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "pool" {
  name                = "pool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size             = "Standard_B2ms"
  node_count          = 1
}

