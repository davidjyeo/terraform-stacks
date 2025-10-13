output "groups" {
  value = {
    level1 = azuread_group.level1.object_id
    level2 = azuread_group.level2.object_id
    level3 = azuread_group.level3.object_id
  }
}
