required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 4.38.0"
  }
  random = {
    source  = "hashicorp/random"
    version = "~> 3.7.2"
  }
  azuread = {
    source  = "hashicorp/azuread"
    version = "~> 3.5.0"
  }
}

provider "azurerm" "this" {
  config {
    features {}

    use_cli = false

    use_oidc        = true
    oidc_token      = var.identity_token
    client_id       = var.client_id
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
  }
}
provider "azuread" "this" {
  config {
    use_oidc   = true
    oidc_token = var.identity_token
    client_id  = var.client_id
    tenant_id  = var.tenant_id
  }
}

provider "random" "this" {}
