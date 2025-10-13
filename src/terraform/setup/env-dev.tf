
module "dev" {
  source  = "Azure-Terraformer/terraform-cloud-credential/azuread//modules/stacks/core-workflow"
  version = "1.0.1"

  application_id = azuread_application.main.id
  organization   = var.organization
  project        = var.application_name
  stack          = "${var.application_name}-${var.service_name}"
  deployment     = "dev"

}

data "azurerm_subscription" "dev" {
  subscription_id = var.dev_subscription
}

resource "azurerm_role_assignment" "dev_owner" {
  provider = azurerm.dev

  scope                = data.azurerm_subscription.dev.id
  role_definition_name = "Owner"
  principal_id         = azuread_service_principal.main.object_id
  principal_type       = "ServicePrincipal"
}
