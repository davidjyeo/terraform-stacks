
data "azuread_users" "group_owners" {
  user_principal_names = ["mark@contoso.com"]
}

locals {
  owners = distinct(concat(
    [data.azuread_client_config.current.object_id],
    [for u in data.azuread_users.group_owners.users : u.object_id]
  ))
}
