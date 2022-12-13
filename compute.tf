resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

module "vmz1" {

  count = var.vm_count

  source = "./modules/vm"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name                = "vm${local.suffix}z1${count.index}"
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
  name                = "vm${local.suffix}z2${count.index}"
  vm_size             = var.vm_size
  subnet_id           = azurerm_subnet.main.id
  ssh_key             = tls_private_key.ssh.public_key_openssh
  zone                = 2

}

module "vmz3" {

  count = var.vm_count

  source = "./modules/vm"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name                = "vm${local.suffix}z3${count.index}"
  vm_size             = var.vm_size
  subnet_id           = azurerm_subnet.main.id
  ssh_key             = tls_private_key.ssh.public_key_openssh
  zone                = 3

}