identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

locals {
  client_id          = "c95e4a8d-9783-45c1-931a-90b0912e084f"
  tenant_id          = "88ef261e-b19b-4d71-9afd-cdac31a6dcda"
  primary_location   = "uksouth"
  secondary_location = "ukwest"
  application_name   = "davidjyeo-application-service"
}

deployment "dev" {
  inputs = {
    identity_token   = identity_token.azurerm.jwt
    client_id        = local.client_id
    tenant_id        = local.tenant_id
    location         = local.secondary_location
    application_name = local.application_name
    subscription_id  = ""
    environment_name = "dev"

    tags = {
      application = local.application_name
      environment = "dev"
    }
  }
}

deployment "prod" {
  inputs = {
    identity_token   = identity_token.azurerm.jwt
    client_id        = local.client_id
    tenant_id        = local.tenant_id
    location         = local.primary_location
    application_name = local.application_name
    subscription_id  = ""
    environment_name = "prod"

    tags = {
      application = local.application_name
      environment = "prod"
    }
  }
}
