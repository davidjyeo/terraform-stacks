resource "azurerm_resource_group" "main" {
  # name     = "rg-${var.application_name}-${var.environment_name}-shared"
  name     = "${module.naming.resource_group.name}-01"
  location = var.location

  # tags = var.tags
}
