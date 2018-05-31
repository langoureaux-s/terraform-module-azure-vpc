terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "azurerm" {}
}

provider "azurerm" {}

# Create ressource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.rg_name}"
  location = "${var.location}"
  tags = "${var.tags}"
}

# Create VPC
resource "azurerm_virtual_network" "vpc" {
  name                = "vpc-${var.name}"
  address_space       = ["${var.address_space}"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  tags = "${var.tags}"
}


# Create subnet
resource "azurerm_subnet" "subnet" {
  count                = "${length(var.subnets)}"
  name                 = "subnet-${lookup(var.subnets[count.index], "name")}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vpc.name}"
  address_prefix       = "${lookup(var.subnets[count.index], "subnet_space")}"
}