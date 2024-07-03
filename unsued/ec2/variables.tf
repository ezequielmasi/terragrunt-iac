variable "ec2_instances" {
  type = map(object({
    name                        = string
    ami                         = string
    instance_type               = string
    subnet_id                   = string
    associate_public_ip_address = bool
    custom_policy_path          = string
    user_data_path              = string
    user_data_replace_on_change = bool
    disable_api_termination     = bool
    monitoring                  = bool
    root_block_device = list(object({
      encrypted   = bool
      throughput  = number
      volume_size = number
      volume_type = string
    }))
    ingress_security_groups = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress_security_groups = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    metadata_options = any
    tags             = map(string)
  }))
  default     = null
  description = "Single object for the creation of one or more EC2 instances"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
