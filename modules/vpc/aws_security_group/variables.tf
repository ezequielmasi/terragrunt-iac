variable "name" {
  description = "Nombre del security group"
}

variable "description" {
  description = "Descripción del security group"
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "ID de la VPC donde se creará el security group"
}

variable "tags" {
  description = "Etiquetas para asignarle al security group"
}

variable "sg_ingress_rules" {
  description = "Reglas de ingreso del security group"
  type        = list(any)
  default     = []
}

variable "cidr_ingress_rules" {
  description = "CIDRs que se habilitan en las reglas de ingreso"
  type        = list(any)
  default     = []
}