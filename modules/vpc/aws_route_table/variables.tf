// module: aws_route_table

variable "propagating_vgws" {
  description = "Lista de virtual gateways para propagación"
  type        = list(any)
  default     = []
}

variable "available_az" {
  description = "Lista de availability zones disponibles"
  type        = list(any)
}

variable "vpc_id" {
  description = "ID de la VPC donde se creará la route table"
}

variable "cluster_name" {
  description = "Nombre del cluster"
}

variable "purpose" {
  description = "Propósito"
}

variable "route_table_count" {
  description = "Cantidad de route tables que serán creadas"
}

variable "identifier_tags" {
  description = "Un mapeo de tags de identificación para asignar a los recursos"
  type        = map(string)
  default     = {}
}

variable "s3_vpc_endpoint_id" {
  description = "Identificación del endpoint de la VPC para S3"
  type        = string
  default     = ""
}

variable "dynamodb_vpc_endpoint_id" {
  description = "Identificación del endpoint de la VPC para DynamoDB"
  type        = string
  default     = ""
}

variable "enable_s3_vpc_endpoint" {
  description = "Determina si se habilita un endpoint de la VPC para S3"
  default     = 0
}

variable "enable_dynamodb_vpc_endpoint" {
  description = "Determina si se habilita un endpoint de la VPC para DynamoDB"
  type        = string
  default     = "0"
}

