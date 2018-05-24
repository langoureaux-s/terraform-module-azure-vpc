# Create ressource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.rg_name}"
  location = "${var.location}"
  tags {
    ${var.tags}
  }
}

# Create VPC
resource "azurerm_virtual_network" "vpc" {
  name                = "vpc-${var.name}"
  address_space       = ["${var.address_space}"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  tags {
    ${var.tags}
  }
}


# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${var.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vpc.name}"
  address_prefix       = "${var.subnet_space}"
  tags {
    ${var.tags}
  }
}