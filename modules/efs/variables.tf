variable "name" {
  type        = string
  description = "EFS Name"
}

variable "backup" {
  type        = bool
  description = "Backup enable or disable"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "source_cidr_blocks" {
  type        = list(string)
  description = "VPC CIDR Range"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnets where mount the EFS"
}

variable "vpc_id" {
  type        = string
  description = "VPC Identificator"
}
