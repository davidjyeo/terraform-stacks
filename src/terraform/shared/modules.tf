module "naming" {
  source = "Azure/naming/azurerm"
  prefix = [
    "${var.application_name}-${var.environment_name}-shared"
  ]
}
