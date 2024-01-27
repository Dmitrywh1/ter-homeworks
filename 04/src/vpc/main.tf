terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

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

locals {
  labels = length(keys(var.labels)) >0 ? var.labels: {
    "env"=var.env_name
    "project"="undefined"
  }
}

resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.env_name == null ? "${var.subnet.sub.name}" : "${var.env_name}-${var.subnet.sub.name}"
  zone           = var.subnet.sub.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.subnet.sub.v4_cidr_blocks]

   labels = {
    for k, v in local.labels : k => v
  }

}