resource "azurerm_resource_group" "zero" {
  name     = var.rg-name
  location = var.location
}

resource "azurerm_network_security_group" "zero" {
  name                = "zero-security-group"
  location            = azurerm_resource_group.zero.location
  resource_group_name = azurerm_resource_group.zero.name
}

resource "azurerm_virtual_network" "zero" {
  name                = "zero-network"
  location            = azurerm_resource_group.zero.location
  resource_group_name = azurerm_resource_group.zero.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.zero.id
  }

  tags = {
    environment = "Production"
  }
}