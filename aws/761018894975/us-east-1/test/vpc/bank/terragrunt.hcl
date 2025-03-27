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
  source = "tfr:///terraform-aws-modules/vpc/aws?version=5.8.1"
}

inputs = {
  
  name = "${local.prefix}"
  cidr = "10.88.0.0/16"
  azs  = ["us-east-1b", "us-east-1c"]

  public_subnets               = ["10.88.0.0/24", "10.88.1.0/24"]
  public_subnet_tags           = { "Type" = "public" }
  
  private_subnets              = ["10.88.10.0/24", "10.88.11.0/24"]
  private_subnet_tags          = { "Type" = "private" }

  database_subnets             = ["10.88.20.0/24", "10.88.21.0/24"]
  database_subnet_tags         = { "Type" = "database" }
  create_database_subnet_group = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dhcp_options      = true
  dhcp_options_domain_name = "ec2.internal"
  
  create_flow_log_cloudwatch_log_group            = false
  create_flow_log_cloudwatch_iam_role             = false
  enable_flow_log                                 = false
  flow_log_cloudwatch_log_group_retention_in_days = 30
  flow_log_traffic_type                           = "DENY"

}
