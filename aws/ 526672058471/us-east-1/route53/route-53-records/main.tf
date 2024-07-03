module "route_53_record" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "2.11.1"

  for_each = var.route_53_record

  private_zone        = each.value.private_zone
  zone_name           = each.value.zone_name
  records_jsonencoded = each.value.records_jsonencoded
}
