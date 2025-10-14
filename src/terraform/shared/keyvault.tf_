resource "azurerm_key_vault" "main" {

  name                = "kv-${random_string.suffix.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  purge_protection_enabled      = false
  soft_delete_retention_days    = 7
  public_network_access_enabled = true
  enable_rbac_authorization     = true

}

# Terraform Access to KeyVault
resource "azurerm_role_assignment" "terraform_keyvault_admin" {
  principal_id                     = data.azurerm_client_config.current.object_id
  scope                            = azurerm_key_vault.main.id
  role_definition_name             = "Key Vault Administrator"
  skip_service_principal_aad_check = true
}

# Secret for GitHub PAT
resource "azurerm_key_vault_secret" "github_pat_token" {
  name             = "github-pat"
  value_wo         = "szechuan" # will change later ;-)
  value_wo_version = 1
  key_vault_id     = azurerm_key_vault.main.id

  depends_on = [azurerm_role_assignment.terraform_keyvault_admin]
}

# Operator Access to KeyVault
resource "azurerm_role_assignment" "level3_keyvault_admin" {
  principal_id                     = var.groups.level3
  principal_type                   = "Group"
  scope                            = azurerm_key_vault.main.id
  role_definition_name             = "Key Vault Administrator"
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "level2_keyvault_contributor" {
  principal_id                     = var.groups.level2
  principal_type                   = "Group"
  scope                            = azurerm_key_vault.main.id
  role_definition_name             = "Key Vault Contributor"
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "level1_keyvault_reader" {
  principal_id                     = var.groups.level1
  principal_type                   = "Group"
  scope                            = azurerm_key_vault.main.id
  role_definition_name             = "Key Vault Reader"
  skip_service_principal_aad_check = true
}
