resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.name}aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.name}k8s"

  default_node_pool {
    name            = "labs"
    node_count      = 3
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

  role_based_access_control_enabled = true


}
