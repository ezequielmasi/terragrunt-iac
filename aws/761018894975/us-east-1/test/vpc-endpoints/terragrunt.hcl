locals {
  account_vars     = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  prefix = "${local.environment_vars.locals.environment}-${basename(get_terragrunt_dir())}"
}

include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//modules/vpc-endpoints?version=5.8.1"
}

dependency "vpc" {
  config_path = "../vpc/bank"

  mock_outputs = {
    vpc_id = "vpc-dummy-plan"
    private_subnets = ["subnet-dummy-plan-1","subnet-dummy-plan-2"]
    vpc_cidr_block = "10.0.0.0/16"
  }
  
  mock_outputs_merge_strategy_with_state = "shallow"
}

inputs = {
  vpc_id                     = dependency.vpc.outputs.vpc_id
  create_security_group      = true
  security_group_name        = "${local.prefix}-vpc-endpoint"
  security_group_description = "VPC endpoints security group"
  security_group_rules = {
    all_traffic = {
      description = "All trafic from VPC"
      cidr_blocks = [dependency.vpc.outputs.vpc_cidr_block]
    }
  }

  endpoints = {
    ssm = {
      service             = "ssm"
      private_dns_enabled = true
      subnet_ids          = dependency.vpc.outputs.private_subnets
      tags                = { "Name" = "ssm-${local.prefix}"}
    },
    ssmmessages = {
      service             = "ssmmessages"
      private_dns_enabled = true
      subnet_ids          = dependency.vpc.outputs.private_subnets
      tags                = { "Name" = "ssmmessages-${local.prefix}"}
    },
    ec2 = {
      service             = "ec2"
      private_dns_enabled = true
      subnet_ids          = dependency.vpc.outputs.private_subnets
      tags                = { "Name" = "ec2-${local.prefix}"}
    },
    ec2messages = {
      service             = "ec2messages"
      private_dns_enabled = true
      subnet_ids          = dependency.vpc.outputs.private_subnets
      tags                = { "Name" = "ec2messages-${local.prefix}"}
    }
  }
}
