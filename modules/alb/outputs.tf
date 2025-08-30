output "alb_arn" {
  description = "ARN do Application Load Balancer"
  value       = aws_lb.web.arn
}

output "alb_dns_name" {
  description = "DNS público do ALB"
  value       = aws_lb.web.dns_name
}

output "alb_zone_id" {
  description = "Hosted Zone ID do ALB (usado para Route53)"
  value       = aws_lb.web.zone_id
}

output "alb_listener_arn" {
  description = "ARN do Listener HTTPS do ALB"
  value       = aws_lb_listener.https.arn
}

output "target_group_arn" {
  description = "ARN do Target Group associado ao ALB"
  value       = aws_lb_target_group.web-tg-for-alb.arn
}
