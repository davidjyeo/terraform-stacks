
resource "azuread_application" "main" {
  display_name = "hcp-${var.organization}-${var.application_name}-${var.service_name}-stack"
}

resource "azuread_service_principal" "main" {
  client_id = azuread_application.main.client_id
}
