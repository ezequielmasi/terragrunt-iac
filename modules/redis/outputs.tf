output "name" {
  value       = try(var.name, "")
  description = "The name of the replication group."
}

output "engine" {
  value       = try(var.engine_version, "")
  description = "The engine version of the cluster"
}

output "endpoint" {
  value       = try(aws_elasticache_replication_group.default.primary_endpoint_address, "")
  description = "The address of the endpoint for the primary node in the replication group."
}

output "port" {
  value       = try(var.port, "")
  description = "The port for the service"
}
