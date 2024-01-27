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

variable "subnet_zone" {
  type = string
  default = "ru-central1-a"
}

variable "default_cidr" {
  type = list(string)
  default = ["10.0.1.0/24"]
}

variable "subnet_name" {
  type = string
  default = "sub"
}