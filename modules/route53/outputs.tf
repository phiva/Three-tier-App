output "name_servers" {
  description = "List of NS records of the hosted zone"
  value       = aws_route53_zone.primary.name_servers
}

output "zone_id" {
  description = "Route53 hosted zone ID"
  value       = aws_route53_zone.primary.zone_id
}