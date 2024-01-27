variable "vpc_name" {
  type = string
  default = "test"
}

variable "labels" {
  description = "for dynamic block 'labels' "
  type        = map(string)
  default = {}
}

variable "env_name" {
  description = "Environment name"
}

variable "vpc_zone" {
  description = "VPC zone"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
}
