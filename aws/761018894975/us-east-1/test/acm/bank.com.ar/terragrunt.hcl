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
  source = "tfr:///terraform-aws-modules/acm/aws?version=5.0.1"
}

inputs = {
  domain_name               = "*.${basename(get_terragrunt_dir())}"
  validation_method         = "DNS"
  subject_alternative_names = ["${basename(get_terragrunt_dir())}"]
  wait_for_validation       = false
  create_route53_records    = false
}
