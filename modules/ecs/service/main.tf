## IAM DEFAULT POLICY

resource "aws_iam_role_policy_attachment" "default_policy" {
  role       = aws_iam_role.service_role.name
  policy_arn = data.aws_iam_policy.default_policy.arn
}

## IAM ROLE

resource "aws_iam_role" "service_role" {

  name = "${var.name_prefix}-${var.name}-ecs-role"

  assume_role_policy = jsonencode({
    "Version" : "2008-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ecs-tasks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = var.tags
}


resource "aws_iam_policy" "ecs_service_elb" {
  name        = "${var.name_prefix}-${var.name}-elb-policy"
  path        = "/"
  description = "Allow ECS service to ELB"
  policy      = data.aws_iam_policy_document.ecs_service_elb.json
}

resource "aws_iam_policy" "ecs_service_scaling" {
  name        = "${var.name_prefix}-${var.name}-asg-policy"
  path        = "/"
  description = "Allow ECS service to ASG"
  policy      = data.aws_iam_policy_document.ecs_service_scaling.json
}

resource "aws_iam_policy" "ecs_service_secrets_manager" {
  name        = "${var.name_prefix}-${var.name}-sm-policy"
  path        = "/"
  description = "Allow ECS service to SECRETS MANAGER"
  policy      = data.aws_iam_policy_document.ecs_service_secrets_manager.json
}

resource "aws_iam_role_policy_attachment" "ecs_service_elb" {
  role       = aws_iam_role.service_role.name
  policy_arn = aws_iam_policy.ecs_service_elb.arn
}

resource "aws_iam_role_policy_attachment" "ecs_service_scaling" {
  role       = aws_iam_role.service_role.name
  policy_arn = aws_iam_policy.ecs_service_scaling.arn
}

resource "aws_iam_role_policy_attachment" "ecs_service_secrets_manager" {
  role       = aws_iam_role.service_role.name
  policy_arn = aws_iam_policy.ecs_service_secrets_manager.arn
}

## ECS TASK DEFINITION

resource "aws_ecs_task_definition" "this" {
  family = "${var.name_prefix}-${var.name}-td"

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = var.task_cpu
  memory = var.task_memory

  execution_role_arn    = aws_iam_role.service_role.arn
  task_role_arn         = aws_iam_role.service_role.arn
  container_definitions = var.container_definition

  tags = var.tags
}

## SECURITY GROUP

resource "aws_security_group" "this" {
  name   = "${var.name_prefix}-${var.name}-sg"
  vpc_id = data.aws_vpc.selected.id

  ingress {
    description = "Allow ingress traffic"
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

## CLOUDWATCH LOG GROUP

resource "aws_cloudwatch_log_group" "this" {
  name              = "${var.name_prefix}-${var.name}-lg"
  retention_in_days = 7
  tags              = var.tags
}

## ECS SERVICE

resource "aws_ecs_service" "this" {
  name            = "${var.name_prefix}-${var.name}-srv"
  cluster         = data.aws_ecs_cluster.this.cluster_name
  task_definition = "${aws_ecs_task_definition.this.family}:${aws_ecs_task_definition.this.revision}"

  health_check_grace_period_seconds = 0
  propagate_tags                    = "TASK_DEFINITION"
  launch_type                       = "FARGATE"

  network_configuration {
    assign_public_ip = false
    security_groups  = [aws_security_group.this.id]
    subnets          = data.aws_subnets.application.ids
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.service.arn
    container_name   = var.name
    container_port   = var.container_port
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  deployment_controller {
    type = "ECS"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      desired_count,
      task_definition
    ]
  }

  desired_count                      = 1
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  tags = var.tags
}

## AUTOS SCALLING

resource "aws_appautoscaling_target" "this_target" {
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  resource_id        = "service/${data.aws_ecs_cluster.this.cluster_name}/${var.name_prefix}-${var.name}-srv"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "this_memory" {
  name               = "${var.name_prefix}-${var.name}-memory-asg-policy"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.this_target.resource_id
  scalable_dimension = aws_appautoscaling_target.this_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.this_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value = var.memory_target_value
  }
}

resource "aws_appautoscaling_policy" "this_cpu" {
  name               = "${var.name_prefix}-${var.name}-cpu-asg-policy"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.this_target.resource_id
  scalable_dimension = aws_appautoscaling_target.this_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.this_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = var.cpu_target_value
  }
}

## LOAD BALANCER LISTENER

resource "aws_lb_listener_rule" "host_based_weighted_routing" {
  listener_arn = var.type == "public" ? data.aws_lb_listener.selected443.arn : data.aws_lb_listener.selected443_int.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service.arn
  }

  condition {
    host_header {
      values = ["${var.dns_public_subdomain}.${var.dns_public_domain}"]
    }
  }

  lifecycle {
    ignore_changes = [
      condition
    ]
  }

  depends_on = [
    aws_lb_target_group.service
  ]
}

## LOAD BALANCER TARGET GROUPS

resource "aws_lb_target_group" "service" {
  name                 = "${var.name_prefix}-${var.name}-tg"
  port                 = var.container_port
  protocol             = "HTTP"
  target_type          = "ip"
  deregistration_delay = 30
  vpc_id               = data.aws_vpc.selected.id
  health_check {
    path              = var.health_check_path
    healthy_threshold = 2
    interval          = 10
  }
}

## DNS RECORD

resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${var.dns_public_subdomain}.${var.dns_public_domain}"
  type    = "A"

  alias {
    name                   = var.type == "public" ? data.aws_lb.selected.dns_name : data.aws_lb.selected_int.dns_name
    zone_id                = var.type == "public" ? data.aws_lb.selected.zone_id : data.aws_lb.selected_int.zone_id
    evaluate_target_health = false
  }
}
