resource "aws_subnet" "main" {
  count = var.subnet_count * var.enable_subnet

  availability_zone = element(var.available_az, count.index)
  cidr_block = cidrsubnet(
    var.cidr_block,
    var.subnet_size - element(split("/", var.cidr_block), 1),
    element(var.subnet_assignment, count.index),
  )
  vpc_id = var.vpc_id

  map_public_ip_on_launch = var.is_public

  tags = merge(
    {
      "Name" = "${var.name}-${var.subnet_type}-${element(var.available_az, count.index)}"
    },
    var.tag_values,
    var.identifier_tags,
  )
}

