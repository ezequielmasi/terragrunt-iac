## GENERAL

variable "project" {
  type        = string
  description = "Nombre de proyecto"
}

variable "environment" {
  type        = string
  description = "Nombre del entorno a ejecutar"
}

variable "layer" {
  type        = string
  description = "Nombre de la capa de trabajo (networking, persistence & applicacion)"
}

variable "region" {
  type        = string
  description = "Region donde se depliegan los recursos"
}

variable "team" {
  type        = string
  description = "Equipo de trabajo sobre la IaC"
}

## DNS

variable "dns_public" {
  type = map(object({
    create  = bool
    comment = string
  }))
  description = "Public DNS list"
}

## ECR

variable "ecr_repositories" {
  default     = {}
  description = "List of repositories for ECR"
  type = map(object({
    tag_prefix_list          = list(string)
    scan_on_push             = bool
    image_tag_mutability     = string
    max_untagged_image_count = number
    max_tagged_image_count   = number
  }))
}