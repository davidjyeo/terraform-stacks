
data "azuread_users" "level1" {
  user_principal_names = ["user@domain.io"]
}

locals {
  level1_member_ids = toset([for u in data.azuread_users.level1.users : u.object_id])
}

resource "azuread_group" "level1" {
  display_name     = "${var.application_name}-${var.environment_name}-L1"
  security_enabled = true
  owners           = local.owners
}

resource "azuread_group_member" "level1" {
  for_each         = local.level1_member_ids
  group_object_id  = azuread_group.level1.object_id
  member_object_id = each.key
}
