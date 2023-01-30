locals {

  name_prefix = "${var.project}-${var.environment}"

  tags = merge({
    project     = var.project
    environment = var.environment
    layer       = var.layer
    region      = var.region
    team        = var.team
  })

}

## DNS PUBLIC

# module "dns_public_zones" {
#   source = "../../../../modules/route53/public_zone"

#   for_each = var.dns_public

#   create_zone = each.value.create
#   comment     = each.value.comment
#   name        = each.key
#   tags        = local.tags
# }

# data "aws_route53_zone" "selected" {
#   for_each     = module.dns_public_zones
#   name         = "${each.value.domain_name}."
#   private_zone = false

#   depends_on = [
#     module.dns_public_zones
#   ]
# }

# ## CERTIFICATE FOR DNS PULBIC

# module "acm" {
#   source = "../../../../modules/acm"

#   for_each = data.aws_route53_zone.selected

#   domain_name = trimsuffix(each.value.name, ".")
#   zone_id     = each.value.zone_id

#   subject_alternative_names = [
#     "*.${trimsuffix(each.value.name, ".")}"
#   ]

#   wait_for_validation = false
#   tags                = local.tags

#   depends_on = [
#     data.aws_route53_zone.selected
#   ]
# }

## ECR REPOSITORIES

module "ecr_repositories" {

  source = "../../../../modules/ecr"

  for_each = var.ecr_repositories

  name                     = each.key
  tag_prefix_list          = each.value.tag_prefix_list
  scan_on_push             = each.value.scan_on_push
  image_tag_mutability     = each.value.image_tag_mutability
  max_untagged_image_count = each.value.max_untagged_image_count
  max_tagged_image_count   = each.value.max_tagged_image_count

  tags = local.tags
}