variable "vpc_name" {
  type = string
  default = "develop"
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
  type = string
  default = "ru-central1-a"
}

variable "vpc_cidr" {
  type = list(string)
  default = ["10.0.1.0/24"]
}

