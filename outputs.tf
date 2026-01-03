output "route53_hosted_zone_id" {
  description = "The ID of the newly created AWS Route53 Hosted Zone."
  value       = aws_route53_zone.delegated_zone.zone_id
}

output "route53_nameservers" {
  description = "The list of AWS nameservers that were used for delegation in Cloudflare."
  value       = aws_route53_zone.delegated_zone.name_servers
}
