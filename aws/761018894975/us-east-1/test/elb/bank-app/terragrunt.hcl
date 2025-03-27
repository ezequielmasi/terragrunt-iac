locals {
  account_vars     = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  prefix = "${local.environment_vars.locals.environment}-${basename(get_terragrunt_dir())}"
}

include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/alb/aws?version=9.11.0"
}

dependency "vpc" {
  config_path = "../../vpc/bank"

  mock_outputs = {
    vpc_id = "vpc-dummy-plan"
    public_subnets = ["subnet-dummy-plan-1","subnet-dummy-plan-2"]
  }
  
  mock_outputs_merge_strategy_with_state = "shallow"
}

dependency "acm-bank" {
  config_path = "../../acm/bank.com.ar"

  mock_outputs = {
    acm_certificate_arn = "arn:aws:acm:us-east-1:324234234324:certificate/b5baa18a-795c-43a4-8a52-a14c4e747464"
  }
  
  mock_outputs_merge_strategy_with_state = "shallow"
}

inputs = {
  name    = "${local.prefix}"
  vpc_id  = dependency.vpc.outputs.vpc_id
  subnets = dependency.vpc.outputs.public_subnets
  
  enable_deletion_protection = false

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
      forward = {
        target_group_key = "api"
      }
      # redirect = {
      #   port        = "443"
      #   protocol    = "HTTPS"
      #   status_code = "HTTP_301"
      # }
    }
    # https = {
    #   port            = 443
    #   protocol        = "HTTPS"
    #   certificate_arn = dependency.acm-bank.outputs.acm_certificate_arn
    #   ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
    #   type            = "forward"
    #   forward = {
    #     target_group_key = "dataagro"
    #   }
    # }
  }

  target_groups = {
    api = {
      protocol          = "HTTP"
      port              = 80
      target_type       = "ip"
      create_attachment = false
    }
  }
}



