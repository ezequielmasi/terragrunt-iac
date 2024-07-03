include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/route53/aws//modules/zones?version=2.11.1"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  zones = {
    "usmon.local" = {
      domain_name = "usmon.local"
      vpc = [
        {
          vpc_id = dependency.vpc.outputs.vpc_id
        }
      ]
    }

  }
}
