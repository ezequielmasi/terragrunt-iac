// module: aws_subnet

// default:   enable subnet creation.  Useful for determining if private subnet
//      should be created based on whether private subnet should be created in the first place
// this parameter should be better removed entirely
variable "enable_subnet" {
  description = "Determina si se creará una subnet. Si su valor es 0, la misma no se creará"
  default     = "1"
}

// this is the cidr_block of the entire vpc.  Specific subnets will be created based on the subnet_offset
variable "cidr_block" {
  description = "CIDR Block de la VPC"
}

variable "subnet_size" {
  description = "Tamaño de la subnet, definida por el CIDR"
}

variable "vpc_id" {
  description = "ID de la VPC"
}

variable "available_az" {
  description = "Lista de Availability zones disponibles para la creación de la subnet"
  type        = list(any)
}

variable "number_of_az" {
  description = "Número de availability zones"
  default     = "3"
}

variable "subnet_type" {
  description = "Tipo de subnet creada"
}

variable "tag_values" {
  description = "Mapeo de valores de tags"
  type        = map(string)
  default     = {}
}

variable "subnet_count" {
  description = "Cantidad de subnets que se crearán"
}

variable "subnet_assignment" {
  description = "Lista para la asignación de subnets al CIDR"
  type        = list(any)
}

variable "identifier_tags" {
  description = "Mapeo de tags de identificación para asignar a los recursos"
  type        = map(string)
  default     = {}
}

variable "is_public" {
  description = "Determina si la subnet es pública"
}

variable "name" {
  description = "Nombre de la subnet"
}

