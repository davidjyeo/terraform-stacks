variable "application_name" {
  description = "Name of the application"
  type        = string
}

variable "environment_name" {
  description = "Name of the environment"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
}

variable "identity_token" {
  type      = string
  ephemeral = true
}

variable "client_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "primary_location" {
  description = "Primary Region"
  type        = string
}
