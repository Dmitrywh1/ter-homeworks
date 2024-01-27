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
  name           = var.env_name == null ? "${var.subnet.sub.name}" : "${var.env_name}-${var.subnet.sub.name}"
  zone           = var.subnet.sub.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.subnet.sub.v4_cidr_blocks]

   labels = {
    for k, v in local.labels : k => v
  }

}