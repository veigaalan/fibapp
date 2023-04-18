terraform {
  backend "azurerm" {
    resource_group_name = "RGremotestate"
    storage_account_name = "remotestatelabstg"
    container_name = "remotestagelab"
    key = "terraform_remotastate_lab"
    
  }
}