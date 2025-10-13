
module "prod" {
  source  = "Azure-Terraformer/terraform-cloud-credential/azuread//modules/stacks/core-workflow"
  version = "1.0.1"

  application_id = azuread_application.main.id
  organization   = var.organization
  project        = var.application_name
  stack          = "${var.application_name}-${var.service_name}"
  deployment     = "prod"

}

data "azurerm_subscription" "prod" {
  subscription_id = var.prod_subscription
}

resource "azurerm_role_assignment" "prod_owner" {
  provider = azurerm.prod

  scope                = data.azurerm_subscription.prod.id
  role_definition_name = "Owner"
  principal_id         = azuread_service_principal.main.object_id
  principal_type       = "ServicePrincipal"
}
