module "naming" {
  source = "Azure/naming/azurerm"
  suffix = [
    "${var.application_name}-${var.environment_name}-shared"
  ]
}

module "avm-utl-network-ip-addresses" {
  source                        = "Azure/avm-utl-network-ip-addresses/azurerm"
  address_space                 = var.cidr_addr
  address_prefixes              = var.address_prefixes_ordered
  enable_telemetry              = var.enable_telemetry
  address_prefix_efficient_mode = false
}
