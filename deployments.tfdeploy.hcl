identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

locals {
  client_id        = "00000000-0000-0000-0000-000000000000"
  tenant_id        = "00000000-0000-0000-0000-000000000000"
  primary_location = "westus3"
  application_name = "contoso-product1-devops"
}

deployment "dev" {
  inputs = {
    identity_token   = identity_token.azurerm.jwt
    client_id        = local.client_id
    tenant_id        = local.tenant_id
    primary_location = local.primary_location
    application_name = local.application_name
    subscription_id  = "00000000-0000-0000-0000-000000000000"
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
    primary_location = local.primary_location
    application_name = local.application_name
    subscription_id  = "00000000-0000-0000-0000-000000000000"
    environment_name = "prod"

    tags = {
      application = local.application_name
      environment = "prod"
    }
  }
}
