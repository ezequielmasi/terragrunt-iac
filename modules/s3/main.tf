resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  tags   = var.tags
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = aws_s3_bucket.bucket.id
  policy = jsonencode({
    Version = "2008-10-17"
    Id      = "PolicyForCloudFrontPrivateContent"
    Statement = [{
      Sid    = "1"
      Effect = "Allow"
      Principal = {
        AWS = "${aws_cloudfront_origin_access_identity.this.iam_arn}"
      }
      Action   = "s3:GetObject"
      Resource = "${aws_s3_bucket.bucket.arn}/*"
    }]
  })
}

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = var.bucket
}

data "aws_cloudfront_cache_policy" "this" {
  name = "Managed-CachingOptimized"
}

data "aws_acm_certificate" "issued" {
  domain = var.dns_public
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = var.bucket

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  wait_for_deployment = false
  enabled             = true
  is_ipv6_enabled     = true
  comment             = var.tags.environment
  default_root_object = ""

  aliases = ["${var.subdomain}.${var.dns_public}"]

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.bucket
    cache_policy_id        = data.aws_cloudfront_cache_policy.this.id
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = var.tags

  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.issued.arn
    ssl_support_method  = "sni-only"
  }
}

data "aws_route53_zone" "selected" {
  name         = "${var.dns_public}."
  private_zone = false
}

resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${var.subdomain}.${var.dns_public}"
  type    = "CNAME"
  ttl     = 300
  records = [aws_cloudfront_distribution.s3_distribution.domain_name]
}