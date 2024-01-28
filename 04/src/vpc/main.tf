terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
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

#resource "yandex_vpc_subnet" "develop" {
#  name           = var.env_name == null ? "${var.vpc_zone}" : "${var.env_name}-${var.vpc_zone}"
#  zone           = var.vpc_zone
#  network_id     = yandex_vpc_network.develop.id
#  v4_cidr_blocks = var.vpc_cidr
#
#   labels = {
#    for k, v in local.labels : k => v
#  }
#
#}

resource "yandex_vpc_subnet" "subnet" {
  count          = length(var.subnets)
  name           = var.env_name == null ? "${var.subnets[count.index].zone}" : "${var.env_name}-${var.subnets[count.index].zone}"
  zone           = var.subnets.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.subnets[count.index].cidr]

  labels = {
    for k, v in local.labels : k => v
  }
}
