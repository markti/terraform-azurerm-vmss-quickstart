resource "random_string" "random" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}

locals {
  suffix = random_string.random.result
}

resource "azurerm_resource_group" "main" {
  name      = "rg-${local.suffix}"
  location  = var.location
}

resource "azurerm_orchestrated_virtual_machine_scale_set" "vmss" {
  name                        = "vmss-${local.suffix}"
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  platform_fault_domain_count = var.fault_domain_count
  zones                       = var.zones
}