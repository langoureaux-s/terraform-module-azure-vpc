variable "location" {
    description = "The Azure Region in which the Resource Group exists"
}

variable "rg_name" {
    description = "The name of the Resource Group where VM resources will be created"
}

variable "name" {
    description = "The suffix for all VPC' resources"
}

variable "address_space" {
    description = "The VPC address space"
}

variable "subnet_space" {
    description = "The Subnet space to create"
}


variable "tags" {
    description = "List of tags should be associated on all ressoruces"
    type = "map"
    default = {
        module = "module-azure-vpc"
    }
}


