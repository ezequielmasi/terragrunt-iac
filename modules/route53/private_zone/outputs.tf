output "domain_name" {
  description = "Domain name for a public hosted zone"
  value       = var.name
}

output "name_servers" {
  description = "Name servers for a public hosted zone"
  value       = aws_route53_zone.main.*.name_servers
}
