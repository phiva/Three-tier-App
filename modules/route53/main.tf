# Criar Public hosted zone
resource "aws_route53_zone" "primary" {
  name    = var.domain_name
  comment = "Public hosted zone created via Terraform"
  tags    = merge(var.common_tags, { Name = var.domain_name })
}

resource "aws_route53_record" "records" {
  count   = length(var.record_name)
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.record_name[count.index]
  type    = var.record_type
  ttl     = var.ttl
  records = [var.record_value[count.index]]
}