module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  for_each = var.s3_bucket

  bucket                         = each.value.bucket
  attach_elb_log_delivery_policy = try(each.value.attach_elb_log_delivery_policy, false)
  attach_lb_log_delivery_policy  = try(each.value.attach_lb_log_delivery_policy, false)
  logging                        = {}

  versioning = {
    status = false
  }

  lifecycle_rule = [
    {
      id      = "standard-to-onezone-ia"
      enabled = true
      transition = [
        {
          days          = 30
          storage_class = "ONEZONE_IA"
        }
      ]
    }
  ]
}
