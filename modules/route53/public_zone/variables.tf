variable "name" {
  description = "Name for the hosted zone"
}

variable "comment" {
  default     = "Managed by terraform"
  description = "A comment for the hosted zone. Defaults to 'Managed by Terraform'."
}

variable "force_destroy" {
  default     = false
  description = "Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
}

variable "create_zone" {
  default     = false
  description = "Determines whether a Route53 zone will be created"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the zone."
}