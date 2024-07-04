include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=5.8.1"
}

inputs = {
  name = "nimbus"
  cidr = "172.20.0.0/16"
  azs  = ["us-east-1b", "us-east-1c"]

  public_subnets               = ["172.20.196.0/25", "172.20.196.128/25"]
  public_subnet_names          = ["nimbus-public-196-1b", "nimbus-public-196-1c"]
  public_subnet_tags           = { "Type" = "public" }
  
  private_subnets              = ["172.20.197.0/25", "172.20.197.128/25", "172.20.199.0/25", "172.20.199.128/25", "172.20.195.0/25", "172.20.195.128/25"]
  private_subnet_names         = ["nimbus-services-197-1b", "nimbus-services-197-1c", "nimbus-others-199-1b", "nimbus-others-199-1c", "nimbus-monitoring-195-1b", "nimbus-monitoring-195-1c"]
  private_subnet_tags          = { "Type" = "private" }

  database_subnets             = ["172.20.200.0/25", "172.20.200.128/25"]
  database_subnet_names        = ["nimbus-db-200-1b", "nimbus-db-200-1c"]
  database_subnet_tags         = { "Type" = "database" }
  create_database_subnet_group = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway     = true
  one_nat_gateway_per_az = true

  enable_dhcp_options      = true
  dhcp_options_domain_name = "ec2.internal"
  
  create_flow_log_cloudwatch_log_group            = false
  create_flow_log_cloudwatch_iam_role             = false
  enable_flow_log                                 = false
  flow_log_cloudwatch_log_group_retention_in_days = 30
  flow_log_traffic_type                           = "DENY"

}
