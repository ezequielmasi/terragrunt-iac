variable "environment" {
  description = "Ambiente"
}

variable "user" {
  description = "Usuario"
}

variable "name" {
  description = "Nombre de la VPC"
}

variable "cidr_block" {
  description = "CIDR block qeu se le asignará a la VPC"
}

variable "instance_tenancy" {
  description = "Tenencia de las instancias que se crearán dentro de la VPC"
  default     = "default"
}

variable "enable_dns_support" {
  description = "Determina si la VPC soportará DNS"
  default     = "true"
}

variable "enable_dns_hostnames" {
  description = "Determina si la VPC soportará hostnames de DNS"
  default     = "false"
}

variable "enable_classiclink" {
  description = "Determina si la VPC tendrá Classiclink habilitado"
  default     = "false"
}

variable "enable_classiclink_dns_support" {
  description = "Determina si la VPC tendrá soporte para DNS de Classiclink"
  default     = "false"
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Solicita un CIDR block IPv6 generado por Amazon"
  default     = "false"
}

variable "identifier_tags" {
  description = "Mapeo de tags para asignarle al recurso"
  type        = map(string)
  default     = {}
}

