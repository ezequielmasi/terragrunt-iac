// module: aws_route

// gw = igw or vgw
variable "gw_count" {
  description = "Cantidad de gateways (igw o vgw) que se crearán"
  default     = "0"
}

variable "ngw_count" {
  description = "Cantidad de NAT gateways que se crearán"
  default     = "0"
}

variable "vpc_peering_count" {
  description = "Determina si se establecerá una VPC peering. Si el valor es cero, no se realizará"
  default     = "0"
}

variable "instance_count" {
  description = "Cantidad de instancias que se crearán"
  default     = "0"
}

variable "gw_id_list" {
  description = "Lista de IDs de gateways (igw o vgw)"
  type        = list(any)
  default     = []
}

variable "ngw_id_list" {
  description = "Lista de IDs de NAT gateways"
  type        = list(any)
  default     = []
}

variable "vpc_peering_id" {
  description = "ID de la VPC peering"
  default     = ""
}

variable "instance_id" {
  description = "ID de la instancia"
  type        = list(any)
  default     = []
}

variable "route_table_ids" {
  description = "ID de las route table"
  type        = list(any)
}

variable "dst_cidr_block" {
  description = "CIDR block de destino"
}

