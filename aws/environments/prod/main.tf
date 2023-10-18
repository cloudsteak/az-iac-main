terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = "finall-iac-shared"
    storage_account_name  = "safinallterraform"
    container_name        = "finall-iac-state"
    key                   = "finall-iac-state-file.tfstate"
  }
}

resource "azurerm_resource_group" "finall-iac" {
  name     = "finall-iac"
  location = "Poland Central"
}

resource "azurerm_resource_group" "finall-vm" {
  name     = "finall-vm"
  location = "Poland Central"
}
