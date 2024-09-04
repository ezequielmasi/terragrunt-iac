module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.11.0"

  for_each = var.load_balanacers

  name                         = each.key
  vpc_id                       = each.value.vpc_id
  subnets                      = each.value.subnets
  security_group_ingress_rules = each.value.security_group_ingress_rules
  security_group_egress_rules  = each.value.security_group_egress_rules
  access_logs                  = each.value.access_logs
  listeners                    = each.value.listeners
  target_groups                = each.value.target_groups
  tags                         = each.value.tags
}
