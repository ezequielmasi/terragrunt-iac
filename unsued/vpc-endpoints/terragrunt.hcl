include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//modules/vpc-endpoints?version=5.8.1"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  vpc_id                     = dependency.vpc.outputs.vpc_id
  create_security_group      = true
  security_group_name        = "usmon-prod-vpc-endpoints"
  security_group_description = "VPC endpoints security group"
  security_group_rules = {
    ingress_https = {
      description = "HTTPS from VPC"
      cidr_blocks = [dependency.vpc.outputs.vpc_cidr_block]
    }
  }

  endpoints = {
    s3 = {
      service         = "s3"
      service_type    = "Gateway"
      route_table_ids = dependency.vpc.outputs.private_route_table_ids
      tags            = { Name = "usmon-prod-s3" }
    },
    ssm = {
      service             = "ssm"
      private_dns_enabled = true
      subnet_ids          = dependency.vpc.outputs.private_subnets
      tags                = { "Name" = "usmon-prod-ssm" }
    },
    ssmmessages = {
      service             = "ssmmessages"
      private_dns_enabled = true
      subnet_ids          = dependency.vpc.outputs.private_subnets
      tags                = { "Name" = "usmon-prod-ssmmessages" }
    },
    ec2 = {
      service             = "ec2"
      private_dns_enabled = true
      subnet_ids          = dependency.vpc.outputs.private_subnets
      tags                = { "Name" = "usmon-prod-ec2" }
    },
    ec2messages = {
      service             = "ec2messages"
      private_dns_enabled = true
      subnet_ids          = dependency.vpc.outputs.private_subnets
      tags                = { "Name" = "usmon-prod-ec2messages" }
    }
  }
}
