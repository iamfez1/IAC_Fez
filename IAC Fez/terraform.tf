terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.5.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "0eb051a2-8384-409a-b1dc-5decc2ea7d4a"
}

provider "azurerm" {
  features {}

  alias           = "Dev"
  subscription_id = "0eb051a2-8384-409a-b1dc-5decc2ea7d4a"
}
