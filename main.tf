terraform {
  required_version = "~> 1.3"
  required_providers {
    azurerm = {
      version = "~> 3.23"
    }
    random = {
      source  = "hashicorp/random"
      version = "2.3.0"
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = "d23c01fa-5060-43cd-a999-9dd91ef91994"
}

