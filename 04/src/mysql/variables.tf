variable "mysql_cluster" {
  type = map(object({
    name               = string
    environment        = string
    version            = string
    resource_preset_id = string
    disk_type_id       = string
    disk_size          = number
    type               = string
    day                = string
    hour               = number
    zone_a             = string
    zone_b             = string
  }))
  default = {
    first = {
      name               = "test"
      environment        = "PRESTABLE"
      version            = "8.0"
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 16
      type               = "WEEKLY"
      day                = "SAT"
      hour               = 12
      zone_a             = "ru-central1-a"
      zone_b             = "ru-central1-b"
    }
  }
}

variable "vpc_foo" {
  type = map(string)
  default = {
    zone = "ru-central1-a"
    v4_cidr_blocks = "10.1.0.0/24"
  }
}

variable "vpc_bar" {
  type = map(string)
  default = {
    zone = "ru-central1-b"
    v4_cidr_blocks = "10.2.0.0/24"
  }
}