variable "vpc_name" {
  type = string
  default = "test"
}

variable "subnet" {
  type = map(object({
    name           = string
    zone           = string
    network_id     = string
    v4_cidr_blocks = string
  }))
  default = {
    sub = {
    name           = "develop-ru-central1-a"
    zone           = "ru-central1-a"
    network_id     = null
    v4_cidr_blocks = "10.0.1.0/24"
    }
  }
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