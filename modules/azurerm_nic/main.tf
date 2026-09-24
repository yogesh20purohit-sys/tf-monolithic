data "azurerm_subnet" "snet" {
    for_each = var.nics
    name = each.value.snet_name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
}
data "azurerm_public_ip" "pip" {
  for_each = var.nics
  name = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface" "nic" {
  for_each = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "Internal"
    subnet_id                     = data.azurerm_subnet.snet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}