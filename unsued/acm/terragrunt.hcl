
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/acm/aws?version=5.0.1"
}

inputs = {
  domain_name       = "*.usmon.com"
  zone_id           = "Z10205532VIR57FTJQUWQ"
  validation_method = "DNS"
  subject_alternative_names = [
    "usmon.com"
  ]
  wait_for_validation = true
}
