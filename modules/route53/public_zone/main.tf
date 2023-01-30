resource "aws_route53_zone" "main" {
  name          = var.name
  comment       = var.comment
  tags          = var.tags
  force_destroy = var.force_destroy
}
