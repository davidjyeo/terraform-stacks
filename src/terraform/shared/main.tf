resource "azurerm_resource_group" "main" {
  name     = "${module.naming.resource_group.name}-01"
  location = var.location
}

module "main_virtualnetwork" {
  source           = "Azure/avm-res-network-virtualnetwork/azurerm"
  address_space    = [var.main_cidr_addr]
  location         = module.regions.regions[0].name
  parent_id        = azurerm_resource_group.main.id
  name             = "${module.main_naming.virtual_network.name}-01"
  enable_telemetry = var.enable_telemetry

  subnets = {
    subnet0 = {
      name                            = "${module.main_naming.subnet.name}-01"
      default_outbound_access_enabled = true
      address_prefixes                = [module.main-avm-utl-network-ip-addresses.address_prefixes["a"]]
    }
    subnet1 = {
      name                            = "AzureBastionSubnet"
      default_outbound_access_enabled = true
      address_prefixes                = [module.main-avm-utl-network-ip-addresses.address_prefixes["b"]]
    }
  }
}
