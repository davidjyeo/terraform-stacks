
data "azuread_users" "level3" {
  user_principal_names = ["mark@contoso.com"]
}

locals {
  level3_member_ids = toset([for u in data.azuread_users.level3.users : u.object_id])
}

resource "azuread_group" "level3" {
  display_name     = "${var.application_name}-${var.environment_name}-L3"
  security_enabled = true
  owners           = local.owners
}

resource "azuread_group_member" "level3" {
  for_each         = local.level3_member_ids
  group_object_id  = azuread_group.level3.object_id
  member_object_id = each.key
}
