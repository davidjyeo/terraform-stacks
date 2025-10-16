# component "access-control" {
#   source = "./src/terraform/access-control"

#   inputs = {
#     application_name = var.application_name
#     environment_name = var.environment_name
#   }

#   providers = {
#     azuread = provider.azuread.this
#   }
# }

component "shared" {
  source = "./src/terraform/shared"

  inputs = {
    location         = var.primary_location
    application_name = var.application_name
    environment_name = var.environment_name
    tags             = var.tags
    # groups           = component.access-control.groups
  }

  providers = {
    azurerm = provider.azurerm.this
    azapi   = provider.azapi.this
    random  = provider.random.this
  }
}
