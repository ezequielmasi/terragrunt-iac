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
  source = "tfr:///terraform-aws-modules/ecs/aws?version=5.11.4"
}

dependency "vpc" {
  config_path = "../../vpc/bank"

  mock_outputs = {
    vpc_id = "vpc-dummy-plan"
    private_subnets = ["subnet-dummy-plan-1","subnet-dummy-plan-2"]
  }
  
  mock_outputs_merge_strategy_with_state = "shallow"
}

dependency "alb" {
  config_path = "../../elb/bank-app"
}

inputs = {

  cluster_name                           = "${local.prefix}"
  create_cloudwatch_log_group            = true
  cloudwatch_log_group_retention_in_days = 7

  services = {

    api = {

      subnet_ids                  = dependency.vpc.outputs.private_subnets

      force_new_deployment      = false
      create_tasks_iam_role     = true
      create_task_exec_iam_role = true
      create_security_group     = true
      security_group_rules = {
        all-traffic-ingress = {
          type        = "ingress"
          protocol    = -1
          from_port   = 0
          to_port     = 0
          cidr_blocks = ["0.0.0.0/0"]
        }
        all-traffic-egress = {
          type      = "egress"
          protocol  = -1
          from_port = 0
          to_port   = 0
          cidr_blocks = ["0.0.0.0/0"]
        }
      }

      deployment_minimum_healthy_percent = 100

      cpu    = 256
      memory = 512

      container_definitions = jsondecode(templatefile("task-definition/api.json",
          {
            cluster_name = "${local.prefix}"
          }
        )
      )

      deployment_circuit_breaker = {
        enable   = true
        rollback = true
      }

      load_balancer = {
        port_80 = {
          target_group_arn   = dependency.alb.outputs.target_groups["api"].arn
          container_name     = "api"
          container_port     = 80
        }
      }

      enable_autoscaling = false

      propagate_tags = "SERVICE"
    }

  }

}
