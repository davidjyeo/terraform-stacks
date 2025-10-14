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

# variable "groups" {
#   type = object({
#     level1 = string
#     level2 = string
#     level3 = string
#   })
# }

variable "enable_telemetry" {
  type        = bool
  description = "Enable telemetry for the module"
  default     = false
}

variable "cidr_addr" {
  description = "CIDR address space for the virtual network"
  type        = string
  default     = "10.0.0.0/26"
}

variable "address_prefixes_ordered" {
  type        = map(number)
  description = "The size of the subnets"
  default = {
    "a" = 28
    "b" = 27
    # "c" = 27
    # "d" = 27
    # "e" = 27
  }
}
