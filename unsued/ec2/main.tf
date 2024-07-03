data "aws_iam_policy_document" "ec2_ipd" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_role" {
  for_each = var.ec2_instances

  name               = each.value.name
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ec2_ipd.json
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_policy" {
  for_each = var.ec2_instances

  role       = aws_iam_role.ec2_role[each.key].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ec2_cw_policy" {
  for_each = var.ec2_instances

  role       = aws_iam_role.ec2_role[each.key].name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_policy" "ec2_custom_policy" {
  for_each = var.ec2_instances

  name   = each.value.name
  policy = (each.value.custom_policy_path == "") ? "" : file(each.value.custom_policy_path)
}

resource "aws_iam_role_policy_attachment" "ec2_custom_policy" {
  for_each = var.ec2_instances

  role       = aws_iam_role.ec2_role[each.key].name
  policy_arn = aws_iam_policy.ec2_custom_policy[each.key].arn
}

resource "aws_iam_instance_profile" "ec2_iip" {
  for_each = var.ec2_instances

  name = each.value.name
  path = "/"
  role = aws_iam_role.ec2_role[each.key].name
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "aws_key_pair" "ec2_kp" {
  for_each = var.ec2_instances

  key_name   = each.value.name
  public_key = trimspace(tls_private_key.this.public_key_openssh)
}

resource "aws_secretsmanager_secret" "ec2_kp_store" {
  for_each = var.ec2_instances

  name_prefix             = "ec2-${each.value.name}-"
  description             = "SSH private key"
  recovery_window_in_days = 30
}

resource "aws_secretsmanager_secret_version" "ec2_kp_store" {
  for_each = var.ec2_instances

  secret_id = aws_secretsmanager_secret.ec2_kp_store[each.key].id
  secret_string = jsonencode({
    private_key = "${tls_private_key.this.private_key_pem}"
  })
}

resource "aws_security_group" "ec2_sg" {
  for_each = var.ec2_instances

  name        = each.value.name
  description = each.value.name
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = each.value.ingress_security_groups
    iterator = each
    content {
      description = each.key
      from_port   = each.value.from_port
      to_port     = each.value.to_port
      protocol    = each.value.protocol
      cidr_blocks = each.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = each.value.egress_security_groups
    iterator = each
    content {
      description = each.key
      from_port   = each.value.from_port
      to_port     = each.value.to_port
      protocol    = each.value.protocol
      cidr_blocks = each.value.cidr_blocks
    }
  }
}

module "ec2_host" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  for_each = var.ec2_instances

  name          = each.value.name
  ami           = each.value.ami
  instance_type = each.value.instance_type

  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg[each.key].id]
  associate_public_ip_address = each.value.associate_public_ip_address

  iam_instance_profile = aws_iam_instance_profile.ec2_iip[each.key].name
  key_name             = aws_key_pair.ec2_kp[each.key].key_name

  user_data                   = (each.value.user_data_path == "") ? "" : file(each.value.user_data_path)
  user_data_replace_on_change = each.value.user_data_replace_on_change

  root_block_device = each.value.root_block_device

  disable_api_termination = each.value.disable_api_termination

  metadata_options = each.value.metadata_options

  monitoring = each.value.monitoring

  tags = merge(
    {
      "Name" = "${each.value.name}"
    },
    each.value.tags
  )

  volume_tags = merge(
    {
      "Name" = "${each.value.name}"
    },
    each.value.tags
  )
}
