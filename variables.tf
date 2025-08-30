variable "region" {
  description = "virginia north"
  type        = string
  default     = "us-east-1"
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDRs das subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de CIDRs das subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "azs" {
  description = "Lista das zonas de disponibilidade"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "instance_count" {
  description = "Número de instâncias EC2 a serem criadas"
  type        = number
  default     = 2
}

variable "ami_id" {
  description = "AMI ID para criar as instâncias EC2"
  type        = string
  default     = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.micro"
}
