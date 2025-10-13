terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.38.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.dev_subscription
}

provider "azurerm" {
  alias = "dev"
  features {}
  subscription_id = var.dev_subscription
}

provider "azurerm" {
  alias = "prod"
  features {}
  subscription_id = var.prod_subscription
}
