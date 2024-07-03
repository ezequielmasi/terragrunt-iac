data "aws_availability_zones" "available" {}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}

resource "aws_eip" "this" {
  count = length(local.azs)

  domain = "vpc"
}

module "lb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.9.0"

  for_each = var.load_balancers

  name                       = each.value.name
  load_balancer_type         = each.value.type
  internal                   = each.value.internal
  enable_deletion_protection = each.value.enable_deletion_protection
  vpc_id                     = each.value.vpc_id
  subnets                    = each.value.subnet_mapping ? null : each.value.subnets

  subnet_mapping = each.value.subnet_mapping ? [for i, eip in aws_eip.this :
    {
      allocation_id = eip.id
      subnet_id     = each.value.subnets[i]
    }
  ] : []

  security_group_ingress_rules                                 = each.value.security_group_ingress_rules
  security_group_egress_rules                                  = each.value.security_group_egress_rules
  enforce_security_group_inbound_rules_on_private_link_traffic = each.value.type == "network" ? "on" : null

  access_logs = each.value.access_logs

  listeners     = each.value.listeners
  target_groups = each.value.target_groups
}
