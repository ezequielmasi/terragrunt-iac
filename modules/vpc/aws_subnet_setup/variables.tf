variable "name" {
  description = "Nombre de la subnet"
}

variable "available_az" {
  description = "Lista de Availability zones disponibles para la creación de la subnet"
  type        = list(any)
}

variable "vpc_id" {
  description = "ID de la VPC"
}

variable "is_public" {
  description = "Determina si la subnet es pública"
}

variable "subnet_count" {
  description = "Cantidad de subnets que se crearán"
}

variable "subnet_size" {
  description = "Tamaño de la subnet, definida por el CIDR"
}

variable "subnet_type" {
  description = "Tipo de subnet creada"
}

variable "ngw_count" {
  description = "Cantidad de NAT gateways que se crearán"
  default     = 0
}

variable "gw_count" {
  description = "Cantidad de gateways (igw o vgw) que se crearán"
  default     = 0
}

variable "cidr_block" {
  description = "CIDR Block de la VPC"
}

variable "subnet_assignment_list" {
  description = "Lista para la asignación de subnets al CIDR"
  type        = list(any)
}

variable "ngw_id_list" {
  description = "Lista de IDs de NAT gateways"
  type        = list(any)
  default     = []
}

variable "gw_id" {
  description = "Lista de IDs de gateways (igw o vgw)"
  default     = ""
}

variable "dst_cidr_block" {
  description = "CIDR block de destino"
  default     = "0.0.0.0/0"
}

variable "subnet_tag_values" {
  description = "Mapeo de valores de tags de subnets"
  type        = map(string)
  default     = {}
}

variable "identifier_tags" {
  description = "Mapeo de tags de identificación para asignar a los recursos"
  type        = map(string)
  default     = {}
}

variable "propagating_vgws" {
  description = "Lista de virtual gateways para propagación"
  type        = list(any)
  default     = []
}

variable "s3_vpc_endpoint_id" {
  description = "Identificación del endpoint de la VPC para S3"
  default     = ""
}

variable "dynamodb_vpc_endpoint_id" {
  description = "Identificación del endpoint de la VPC para DynamoDB"
  default     = ""
}

variable "enable_s3_vpc_endpoint" {
  description = "Determina si se habilita un endpoint de la VPC para S3"
  default     = false
}

variable "enable_dynamodb_vpc_endpoint" {
  description = "Determina si se habilita un endpoint de la VPC para DynamoDB"
  default     = "0"
}

variable "enable_ops_peering_routes" {
  description = "Determina si se habilitan las ops peering routes"
  default     = "0"
}

variable "ops_peering_id" {
  description = "ID de la op peering"
  default     = "0"
}

variable "ops_cidr" {
  description = "ops CIDR"
  default     = "0"
}

