include "root" {
  path = find_in_parent_folders()
}

terraform {}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  load_balancers = {
    usmon-prod-alb = {
      name                       = "usmon-prod-alb"
      type                       = "application"
      internal                   = true
      enable_deletion_protection = true
      vpc_id                     = dependency.vpc.outputs.vpc_id
      subnets                    = dependency.vpc.outputs.private_subnets
      subnet_mapping             = false

      security_group_ingress_rules = {
        all_http = {
          from_port   = 80
          to_port     = 80
          ip_protocol = "TCP"
          description = "HTTP web traffic"
          cidr_ipv4   = "0.0.0.0/0"
        }
        all_https = {
          from_port   = 443
          to_port     = 443
          ip_protocol = "TCP"
          description = "HTTPS web traffic"
          cidr_ipv4   = "0.0.0.0/0"
        }
      }

      security_group_egress_rules = {
        all = {
          ip_protocol = "-1"
          cidr_ipv4   = "0.0.0.0/0"
        }
      }

      access_logs = {
        bucket = "usmon-prod-logs-us-west-2"
        prefix = "usmon-prod-alb"
      }

      listeners = {
        ex-http-https-redirect = {
          port     = 80
          protocol = "HTTP"
          redirect = {
            port        = "443"
            protocol    = "HTTPS"
            status_code = "HTTP_301"
          }
        }
        ex-https = {
          port            = 443
          protocol        = "HTTPS"
          ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
          certificate_arn = "arn:aws:acm:us-west-2:546962227516:certificate/a40c459b-82e2-410b-be5c-09ba8202b918"
          fixed_response = {
            content_type = "text/plain"
            status_code  = "503"
          }
        }
      }

      target_groups = {}
    },

    usmon-prod-nlb = {
      name                       = "usmon-prod-nlb"
      type                       = "network"
      internal                   = false
      enable_deletion_protection = true
      vpc_id                     = dependency.vpc.outputs.vpc_id
      subnets                    = dependency.vpc.outputs.public_subnets
      subnet_mapping             = true

      security_group_ingress_rules = {
        all_http = {
          from_port   = 80
          to_port     = 80
          ip_protocol = "TCP"
          description = "HTTP web traffic"
          cidr_ipv4   = "0.0.0.0/0"
        }
        all_https = {
          from_port   = 443
          to_port     = 443
          ip_protocol = "TCP"
          description = "HTTPS web traffic"
          cidr_ipv4   = "0.0.0.0/0"
        }
        mssql-cluster = {
          from_port   = 1433
          to_port     = 1433
          ip_protocol = "TCP"
          description = "MSSQL Server"
          cidr_ipv4   = "0.0.0.0/0"
        }
      }

      security_group_egress_rules = {
        all = {
          ip_protocol = "-1"
          cidr_ipv4   = "0.0.0.0/0"
        }
      }

      access_logs = {
        bucket = "usmon-prod-logs-us-west-2"
        prefix = "usmon-prod-nlb"
      }

      listeners = {
        ex-alb-http = {
          port     = 80
          protocol = "TCP"
          forward  = { target_group_key = "ex-alb-http" }
        }
        ex-alb-https = {
          port     = 443
          protocol = "TCP"
          forward  = { target_group_key = "ex-alb-https" }
        }
        ex-mssql-cluster = {
          port     = 1433
          protocol = "TCP"
          forward  = { target_group_key = "ex-mssql-cluster" }
        }
      }

      target_groups = {
        ex-alb-http = {
          name        = "usmon-prod-alb-http"
          protocol    = "TCP"
          port        = 80
          target_type = "alb"
          target_id   = "arn:aws:elasticloadbalancing:us-west-2:546962227516:loadbalancer/app/usmon-prod-alb/e4daa683fe7aa029"
        }
        ex-alb-https = {
          name        = "usmon-prod-alb-https"
          protocol    = "TCP"
          port        = 443
          target_type = "alb"
          target_id   = "arn:aws:elasticloadbalancing:us-west-2:546962227516:loadbalancer/app/usmon-prod-alb/e4daa683fe7aa029"
        }
        ex-mssql-cluster = {
          name        = "usmon-prod-mssql-cluster"
          protocol    = "TCP"
          port        = 1433
          target_type = "ip"
          target_id   = "10.0.12.5"
        }
      }
    }
  }
}
