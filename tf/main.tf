
# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_name}-rg"
  location = var.region
}

# Create an AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.resource_name}-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akschallenge"
  sku_tier = "Free"

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
    zones = ["3", "2" ]
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}
