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

resource "yandex_vpc_subnet" "develop" {
  name           = var.env_name == null ? "${var.subnet.sub.name}-${count.index}" : "${var.env_name}-${var.subnet.sub.name}-${count.index}"
  zone           = var.env_name == null ? "${var.subnet.sub.zone}-${count.index}" : "${var.env_name}-${var.subnet.sub.zone}-${count.index}"
  network_id     = var.subnet.sub.network_id
  v4_cidr_blocks = [var.subnet.sub.v4_cidr_blocks]

   labels = {
    for k, v in local.labels : k => v
  }

}