data "cloudflare_zone" "zone_info" {
  filter = {
    name = var.cloudflare_zone
  }
}

resource "cloudflare_dns_record" "delegation_records" {
  zone_id = data.cloudflare_zone.zone_info.id
  count   = 4

  name    = replace(var.route53_zone, ".${var.cloudflare_zone}", "")
  type    = "NS"
  content = aws_route53_zone.delegated_zone.name_servers[count.index]
  proxied = false
  ttl     = 300
  comment = "Managed by Opentofu (cloudflare-to-route53-delegation)."
}

