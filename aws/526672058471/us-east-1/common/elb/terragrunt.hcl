include "root" {
  path = find_in_parent_folders()
}

terraform {}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  
  load_balanacers = {

    guestcast = {
      vpc_id  = dependency.vpc.outputs.vpc_id
      subnets = dependency.vpc.outputs.public_subnets

      security_group_ingress_rules = {
        all_http = {
          from_port   = 80
          to_port     = 80
          ip_protocol = "tcp"
          description = "HTTP web traffic"
          cidr_ipv4   = "0.0.0.0/0"
        }
        all_https = {
          from_port   = 443
          to_port     = 443
          ip_protocol = "tcp"
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

      access_logs = {}

      listeners = {
        http = {
          port     = 80
          protocol = "HTTP"
          redirect = {
            port        = "443"
            protocol    = "HTTPS"
            status_code = "HTTP_301"
          }
        }
        https = {
          port            = 443
          protocol        = "HTTPS"
          certificate_arn = "arn:aws:acm:us-east-1:526672058471:certificate/3ae859a3-4021-4daa-a15e-9e5b7041ee14"
          ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06" 
          type            = "forward"
          forward = {
            target_group_key = "guestcast-prod"
          }
        }
      }

      target_groups = {
        guestcast-prod = {
          protocol         = "HTTP"
          port             = 80
          target_type      = "ip"
          create_attachment = false
          tags = { environment  = "prod" }      
        },
        guestcast-backend-staging = {
          protocol              = "HTTP"
          port                  = 6081
          target_type           = "ip"
          create_attachment     = false
          tags = { environment  = "staging" }      
        },
        guestcast-backoffice-staging = {
          protocol              = "HTTP"
          port                  = 6080
          target_type           = "ip"
          create_attachment     = false
          tags = { environment  = "staging" }
        },
        guestcast-bknd-accorall = {
          protocol          = "HTTP"
          port              = 80
          target_type       = "ip"
          create_attachment = false
          tags = { environment  = "prod" }
        },
        guestcast-bknd-hoteles = {
          protocol          = "HTTP"
          port              = 80
          target_type       = "ip"
          create_attachment = false
          tags = { environment  = "prod" }
        },
        guestcast-bknd-marriott = {
          protocol          = "HTTP"
          port              = 80
          target_type       = "ip"
          create_attachment = false
          tags = { environment  = "prod" }
        },
        guestcast-bknd-nh-hotels = {
          protocol          = "HTTP"
          port              = 80
          target_type       = "ip"
          create_attachment = false
          tags = { environment  = "prod" }
        },
        guestcast-bknd-palace-hotels = {
          protocol          = "HTTP"
          port              = 80
          target_type       = "ip"
          create_attachment = false
          tags = { environment  = "prod" }
        },
        guestcast-bknd-posadas = {
          protocol          = "HTTP"
          port              = 80
          target_type       = "ip"
          create_attachment = false
          tags = { environment  = "prod" }
        }
      }

      tags = {
        project = "guestcast"
      }      
    }

  }
}
