variable "bucket" {
  type        = string
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length. A full list of bucket naming rules may be found here."
}

variable "folder" {
  type        = string
  description = "Default folder to create"
}

variable "subdomain" {
  type        = string
  description = "Subdomain for cloudfront"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags for the ECR Repository"
}

variable "dns_public" {
  type        = string
  description = "Public DNS for HTTPS Load balancer listener"
}
