
data "azuread_users" "level2" {
  user_principal_names = ["user@domain.io"]
}

locals {
  level2_member_ids = toset([for u in data.azuread_users.level2.users : u.object_id])
}

resource "azuread_group" "level2" {
  display_name     = "${var.application_name}-${var.environment_name}-L2"
  security_enabled = true
  owners           = local.owners
}

resource "azuread_group_member" "level2" {
  for_each         = local.level2_member_ids
  group_object_id  = azuread_group.level2.object_id
  member_object_id = each.key
}

