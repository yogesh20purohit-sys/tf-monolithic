module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.resource_groups
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_vnet"
  vnets      = var.virtual_networks
}

module "snet" {
  depends_on = [module.vnet]
  source     = "../../modules/azurerm_subnet"
  snets      = var.subnets
}

module "pip" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_public_ip"
  pips       = var.public_ips
}

module "nic" {
  depends_on = [module.snet, module.pip]
  source     = "../../modules/azurerm_nic"
  nics       = var.network_interfaces
}

module "vm" {
  depends_on = [module.nic]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.virtual_machines
}