output "resource_group_id" {
  value = "${azurerm_resource_group.rg.id}"
}

output "resource_group_name" {
  value = "${azurerm_resource_group.rg.name}"
}

output "virtual_network_id" {
  value = "${azurerm_virtual_network.vpc.id}"
}

output "virtual_network_name" {
  value = "${azurerm_virtual_network.vpc.name}"
}

output "subnets_id" {
  value = ["${azurerm_subnet.subnet.*.id}"]
}

output "subnets_name" {
  value = ["${azurerm_subnet.subnet.*.name}"]
}

output "subnets_network" {
  value = ["${azurerm_subnet.subnet.*.address_prefix}"]
}