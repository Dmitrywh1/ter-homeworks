terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_mdb_mysql_cluster" "foo" {
  name        = var.mysql_cluster.name
  environment = var.mysql_cluster.environment
  network_id  = yandex_vpc_network.foo.id
  version     = var.mysql_cluster.version

  resources {
    resource_preset_id = var.mysql_cluster.resource_preset_id
    disk_type_id       = var.mysql_cluster.disk_type_id
    disk_size          = var.mysql_cluster.disk_size
  }

  maintenance_window {
    type = var.mysql_cluster.type
    day  = var.mysql_cluster.day
    hour = var.mysql_cluster.hour
  }

  host {
    zone      = var.mysql_cluster.zone_a
    subnet_id = yandex_vpc_subnet.foo.id
  }

  host {
    zone      = var.mysql_cluster.zone_b
    subnet_id = yandex_vpc_subnet.bar.id
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