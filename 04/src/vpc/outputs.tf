output "vpc_subnet" {
  value = {
    name       = yandex_vpc_subnet.develop.name,
    zone       = yandex_vpc_subnet.develop.zone,
    network_id = yandex_vpc_subnet.develop.network_id,
    cidr       = yandex_vpc_subnet.develop.v4_cidr_blocks
    id         = yandex_vpc_subnet.develop.id
  }
}

# module.analytics.data.yandex_compute_image.my_image:
data "yandex_compute_image" "my_image" {
    created_at    = "2024-01-22T10:56:36Z"
    description   = "ubuntu 20.04 lts"
    family        = "ubuntu-2004-lts"
    folder_id     = "standard-images"
    id            = "fd8m2ak64lipvicd94sf"
    image_id      = "fd8m2ak64lipvicd94sf"
    labels        = {}
    min_disk_size = 5
    name          = "ubuntu-20-04-lts-v20240122"
    os_type       = "linux"
    pooled        = true
    product_ids   = [
        "f2eso7j9e7ul50thacca",
    ]
    size          = 4
    status        = "ready"
}
# module.analytics.yandex_compute_instance.vm[0]:
resource "yandex_compute_instance" "vm" {
    allow_stopping_for_update = true
    created_at                = "2024-01-27T14:21:43Z"
    description               = "TODO: description; {{terraform managed}}"
    folder_id                 = "b1gcn2qnmrs7g9fq1f50"
    fqdn                      = "dev-web-0.ru-central1.internal"
    hostname                  = "dev-web-0"
    id                        = "fhm3fem41uuaradcunfn"
    labels                    = {
        "project" = "analytics"
    }
    metadata                  = {
        "serial-port-enable" = "1"
        "user-data"          = <<-EOT
            #cloud-config
            users:
              - name: ubuntu
                groups: sudo
                shell: /bin/bash
                sudo: ["ALL=(ALL) NOPASSWD:ALL"]
                ssh_authorized_keys:
                  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJXrG37ahpXCptSBiQG4ukIF6X+Xm6NyY0zlsUlXn0DX root@docker

            package_update: true
            package_upgrade: false
            packages:
              - nginx
        EOT
    }
    name                      = "dev-web-0"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmurk4cvbbb77u3n4r7"
        disk_id     = "fhmurk4cvbbb77u3n4r7"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8m2ak64lipvicd94sf"
            size       = 10
            type       = "network-hdd"
        }
    }

    metadata_options {
        aws_v1_http_endpoint = 1
        aws_v1_http_token    = 2
        gce_http_endpoint    = 1
        gce_http_token       = 1
    }

    network_interface {
        index              = 0
        ip_address         = "10.0.1.18"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:37:ba:c4:0f"
        nat                = true
        nat_ip_address     = "158.160.108.192"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b91nl7c537jvqu894k"
    }

    placement_policy {
        host_affinity_rules       = []
        placement_group_partition = 0
    }

    resources {
        core_fraction = 5
        cores         = 2
        gpus          = 0
        memory        = 1
    }

    scheduling_policy {
        preemptible = true
    }
}
# module.marketing.data.yandex_compute_image.my_image:
data "yandex_compute_image" "my_image" {
    created_at    = "2024-01-22T10:56:36Z"
    description   = "ubuntu 20.04 lts"
    family        = "ubuntu-2004-lts"
    folder_id     = "standard-images"
    id            = "fd8m2ak64lipvicd94sf"
    image_id      = "fd8m2ak64lipvicd94sf"
    labels        = {}
    min_disk_size = 5
    name          = "ubuntu-20-04-lts-v20240122"
    os_type       = "linux"
    pooled        = true
    product_ids   = [
        "f2eso7j9e7ul50thacca",
    ]
    size          = 4
    status        = "ready"
}
# module.marketing.yandex_compute_instance.vm[0]:
resource "yandex_compute_instance" "vm" {
    allow_stopping_for_update = true
    created_at                = "2024-01-27T14:21:44Z"
    description               = "TODO: description; {{terraform managed}}"
    folder_id                 = "b1gcn2qnmrs7g9fq1f50"
    fqdn                      = "stage-web-0.ru-central1.internal"
    hostname                  = "stage-web-0"
    id                        = "fhmvtbmqrpe451qvrv4m"
    labels                    = {
        "project" = "marketing"
    }
    metadata                  = {
        "serial-port-enable" = "1"
        "user-data"          = <<-EOT
            #cloud-config
            users:
              - name: ubuntu
                groups: sudo
                shell: /bin/bash
                sudo: ["ALL=(ALL) NOPASSWD:ALL"]
                ssh_authorized_keys:
                  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJXrG37ahpXCptSBiQG4ukIF6X+Xm6NyY0zlsUlXn0DX root@docker

            package_update: true
            package_upgrade: false
            packages:
              - nginx
        EOT
    }
    name                      = "stage-web-0"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmms3ncmaugjfgek5vt"
        disk_id     = "fhmms3ncmaugjfgek5vt"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8m2ak64lipvicd94sf"
            size       = 10
            type       = "network-hdd"
        }
    }

    metadata_options {
        aws_v1_http_endpoint = 1
        aws_v1_http_token    = 2
        gce_http_endpoint    = 1
        gce_http_token       = 1
    }

    network_interface {
        index              = 0
        ip_address         = "10.0.1.15"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:1f:ea:ed:ad"
        nat                = true
        nat_ip_address     = "158.160.103.111"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b91nl7c537jvqu894k"
    }

    placement_policy {
        host_affinity_rules       = []
        placement_group_partition = 0
    }

    resources {
        core_fraction = 5
        cores         = 2
        gpus          = 0
        memory        = 1
    }

    scheduling_policy {
        preemptible = true
    }
}
# module.vpc.yandex_vpc_network.develop:
resource "yandex_vpc_network" "develop" {
    created_at                = "2024-01-27T14:21:41Z"
    default_security_group_id = "enpl1db4vsth374nd7kr"
    folder_id                 = "b1gcn2qnmrs7g9fq1f50"
    id                        = "enp61t4lsm090r46jp5s"
    labels                    = {}
    name                      = "here we go again"
    subnet_ids                = []
}
# module.vpc.yandex_vpc_subnet.develop:
resource "yandex_vpc_subnet" "develop" {
    created_at     = "2024-01-27T14:21:43Z"
    folder_id      = "b1gcn2qnmrs7g9fq1f50"
    id             = "e9b91nl7c537jvqu894k"
    labels         = {
        "env"     = "develop"
        "project" = "undefined"
    }
    name           = "develop-ru-central1-a"
    network_id     = "enp61t4lsm090r46jp5s"
    v4_cidr_blocks = [
        "10.0.1.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}
