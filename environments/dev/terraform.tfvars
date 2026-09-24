resource_groups = {
  rg1 = {
    name     = "rg-dev"
    location = "centralindia"
  }
}

virtual_networks = {
  vnet1 = {
    name                = "vnet-dev"
    resource_group_name = "rg-dev"
    location            = "centralindia"
    address_space       = ["10.10.0.0/16"]
  }
}

subnets = {
  snet1 = {
    name                 = "frontend-subnet"
    virtual_network_name = "vnet-dev"
    resource_group_name  = "rg-dev"
    address_prefixes     = ["10.10.1.0/24"]
  }
  snet2 = {
    name                 = "backend-subnet"
    virtual_network_name = "vnet-dev"
    resource_group_name  = "rg-dev"
    address_prefixes     = ["10.10.2.0/24"]
  }
  snet3 = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "vnet-dev"
    resource_group_name  = "rg-dev"
    address_prefixes     = ["10.10.3.0/26"]
  }
}

public_ips = {
  pip1 = {
    name                = "frontend-pip"
    resource_group_name = "rg-dev"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "backend-pip"
    resource_group_name = "rg-dev"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

network_interfaces = {
  nic1 = {
    name                 = "frontend-nic"
    location             = "centralindia"
    resource_group_name  = "rg-dev"
    snet_name            = "frontend-subnet"
    pip_name             = "frontend-pip"
    virtual_network_name = "vnet-dev"
  }
  nic2 = {
    name                 = "backend-nic"
    location             = "centralindia"
    resource_group_name  = "rg-dev"
    snet_name            = "backend-subnet"
    pip_name             = "backend-pip"
    virtual_network_name = "vnet-dev"
  }
}

virtual_machines = {
  vm1 = {
    name                = "frontend-vm"
    resource_group_name = "rg-dev"
    location            = "centralindia"
    computer_name       = "frontend-comp"
    admin_username      = "adminuser1"
    admin_password      = "P@ssw0rd1"
    nic_name            = "frontend-nic"
  }

  vm2 = {
    name                = "backend-vm"
    resource_group_name = "rg-dev"
    location            = "centralindia"
    computer_name       = "backend-comp"
    admin_username      = "adminuser2"
    admin_password      = "P@ssw0rd2"
    nic_name            = "backend-nic"
  }
}

