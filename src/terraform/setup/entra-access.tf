data "azuread_application_published_app_ids" "well_known" {}

data "azuread_service_principal" "msgraph" {
  client_id = data.azuread_application_published_app_ids.well_known.result["MicrosoftGraph"]
}

resource "azuread_application_api_access" "manage_groups" {
  application_id = azuread_application.main.id
  api_client_id  = data.azuread_application_published_app_ids.well_known.result["MicrosoftGraph"]

  role_ids = [
    data.azuread_service_principal.msgraph.app_role_ids["GroupMember.ReadWrite.All"],
    data.azuread_service_principal.msgraph.app_role_ids["Group.ReadWrite.All"],
    data.azuread_service_principal.msgraph.app_role_ids["User.Read.All"],
  ]
}

