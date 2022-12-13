resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

module "vmz1" {

  count = 0

  source = "./modules/vm"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name                = "vm${local.suffix}${count.index}"
  vm_size             = var.vm_size
  subnet_id           = azurerm_subnet.main.id
  ssh_key             = tls_private_key.ssh.public_key_openssh
  zone                = 1

}

module "vmz2" {

  count = var.vm_count

  source = "./modules/vm"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name                = "vm${local.suffix}${count.index}"
  vm_size             = var.vm_size
  subnet_id           = azurerm_subnet.main.id
  ssh_key             = tls_private_key.ssh.public_key_openssh
  zone                = 2

}