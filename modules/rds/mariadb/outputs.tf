
output "name" {
  description = "The database name"
  value       = try(var.identifier, "")
}

output "engine" {
  description = "The database engine"
  value       = try("${var.engine}-${var.engine_version}", "")
}

output "endpoint" {
  description = "The database connection endpoint"
  value       = try(element(split(":", aws_db_instance.this[0].endpoint), 0), "")
}

output "port" {
  value       = try(var.port, "")
  description = "The port for the service"
}
