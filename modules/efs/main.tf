resource "aws_efs_file_system" "this" {
  tags = merge({
    Name = var.name
    },
    var.tags
  )
}

resource "aws_efs_mount_target" "this" {
  for_each        = toset(var.subnet_ids)
  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = each.key
  security_groups = [aws_security_group.this.id]

  depends_on = [
    aws_efs_file_system.this,
    aws_security_group.this
  ]
}

resource "aws_efs_backup_policy" "this" {
  file_system_id = aws_efs_file_system.this.id

  backup_policy {
    status = var.backup == true ? "ENABLED" : "DISABLED"
  }

  depends_on = [
    aws_efs_file_system.this
  ]
}

## SECURITY GROUP

resource "aws_security_group" "this" {
  name   = "${var.name}-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "TLS from private subnets"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = var.source_cidr_blocks
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