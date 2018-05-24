# terraform-module-azure-vm-linux

This module permit to create VPC, subnet and resource group on azure in easy way from Terragrunt

```
terragrunt = {
  terraform {
    source = "git::https://github.com/langoureaux-s/terraform-module-azure-vpc.git"
  }
  
  location              = "West Europe"
  rg_name               = "bigdata"
  name                  = "myproject"
  address_space         = "10.1.0.0/16"
  subnet_space          = "10.1.2.0/24"
  tags                  = {
                            environment = "test"
                            project = "test"
                        }
}
```