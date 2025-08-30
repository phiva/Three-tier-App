variable "ami_id" {
  type = string
  default = "ami-123476884666"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "IDs das subnets públicas onde criar as instâncias (subnet-xxxxxxxx)"
}
