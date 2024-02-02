terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_mdb_mysql_cluster" "foo" {
  name        = var.mysql_name_cluster
  environment = var.mysql_cluster.first.environment
  network_id  = var.mysql_vpc
  version     = var.mysql_cluster.first.version

  resources {
    resource_preset_id = var.mysql_cluster.first.resource_preset_id
    disk_type_id       = var.mysql_cluster.first.disk_type_id
    disk_size          = var.mysql_cluster.first.disk_size
  }

  maintenance_window {
    type = var.mysql_cluster.first.type
    day  = var.mysql_cluster.first.day
    hour = var.mysql_cluster.first.hour
  }

  host {
    zone      = var.mysql_cluster.first.zone_a
    subnet_id = var.mysql_vpc_subnet_a
  }

  host {
    zone      = var.mysql_cluster.first.zone_b
    subnet_id = var.mysql_vpc_subnet_b
  }
}

resource "yandex_vpc_network" "foo" {}

resource "yandex_vpc_subnet" "foo" {
  zone           = var.vpc_foo.zone
  network_id     = "${yandex_vpc_network.foo.id}"
  v4_cidr_blocks = [var.vpc_foo.v4_cidr_blocks]
}

resource "yandex_vpc_subnet" "bar" {
  zone           = var.vpc_bar.zone
  network_id     = "${yandex_vpc_network.foo.id}"
  v4_cidr_blocks = [var.vpc_bar.v4_cidr_blocks]
}