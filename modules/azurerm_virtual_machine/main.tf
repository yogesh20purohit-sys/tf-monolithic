data "azurerm_network_interface" "nic" {
  for_each = var.vms
  name = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_B2as_v2"
  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]
  computer_name  = each.value.computer_name
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}