include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=5.8.1"
}

inputs = {
  name                                            = "usmon-prod"
  cidr                                            = "10.0.0.0/16" # TODO documentar
  azs                                             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  public_subnets                                  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"] # Autogenera nombres de subnets
  private_subnets                                 = ["10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24"]
  database_subnets                                = ["10.0.12.0/24", "10.0.13.0/24", "10.0.14.0/24"]
  enable_dns_hostnames                            = true
  enable_dns_support                              = true
  enable_nat_gateway                              = true
  one_nat_gateway_per_az                          = true
  enable_dhcp_options                             = true
  create_flow_log_cloudwatch_log_group            = true
  create_flow_log_cloudwatch_iam_role             = true
  enable_flow_log                                 = true
  flow_log_cloudwatch_log_group_retention_in_days = 30
  flow_log_traffic_type                           = "ALL"
  create_database_subnet_group                    = true

  public_subnet_tags = {
    "Type" = "public"
  }

  private_subnet_tags = {
    "Type" = "private"
  }

  database_subnet_tags = {
    "Type" = "database"
  }
}
