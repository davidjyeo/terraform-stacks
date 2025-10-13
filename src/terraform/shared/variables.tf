variable "application_name" {
  description = "Name of the application"
  type        = string
}

variable "environment_name" {
  description = "Name of the environment"
  type        = string
}

variable "location" {
  description = "Location for the resources"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
}

variable "groups" {
  type = object({
    level1 = string
    level2 = string
    level3 = string
  })
}
