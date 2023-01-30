output "name" {
  description = "The database name"
  value       = try("${var.name}-cluster", "")
}

output "engine" {
  description = "The database engine"
  value       = try("${var.engine}-${var.engine_version}", "")
}

output "endpoint" {
  description = "The database connection endpoint"
  value       = try(element(split(":", aws_rds_cluster.default[0].endpoint), 0), "")
}

output "port" {
  description = "The port for the service"
  value       = try(var.port, "")
}
