variable "vpc_id" {
  description = "ID da VPC onde o ALB e o Target Group serão criados"
  type        = string
}

variable "sg_alb_id" {
  description = "ID do Security Group associado ao ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "Lista de subnets públicas para o ALB"
  type        = list(string)
}

variable "certificate_arn" {
  type = string
  description = "ARN do certificado ACM para HTTPS"
}