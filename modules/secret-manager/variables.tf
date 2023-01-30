variable "secret_name" {
  type        = string
  description = "The secret name"
}

variable "tags" {
  default     = {}
  description = "The metadata that you apply to the task definition to help you categorize and organize them"
  type        = map(string)
}
