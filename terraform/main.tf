/*terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name = "RGremotestate"
    storage_account_name = "remotestatelabstg"
    container_name = "remotestagelab"
    key = "terraform_remotastate_lab"
    
  }
}*/

provider "azurerm" {
  features {}
}

provider "random" {
  # Configuration options
}

resource "random_string" "random" {
  length  = 10
  special = false
  upper   = false
}

module "tf-azure-resource_group" {
  source   = "./modules/tf-azure-resource_group"
  name     = var.name
  location = var.location
}


module "tf-azure-app_insights" {
  source              = "./modules/tf-azure-app_insights"
  resource_group_name = module.tf-azure-resource_group.name
  name                = var.name
  location            = var.location
}

module "tf-azure-acr" {
  source              = "./modules/tf-azure-acr"
  resource_group_name = module.tf-azure-resource_group.name
  name                = "${var.name}${random_string.random.result}"
  location            = var.location
}

/*module "tf-azure-aks" {
  source              = "./modules/tf-azure-aks"
  resource_group_name = module.tf-azure-resource_group.name
  name                = "${var.name}${random_string.random.result}"
  location            = var.location
  service_principal_client_id     = "${var.CLIENT_ID}"
  service_principal_client_secret = "${var.CLIENT_SECRET}"
}*/





