module "naming" {
  source = "Azure/naming/azurerm"
  suffix = [
    "${var.application_name}-${var.environment_name}-shared"
  ]
}
