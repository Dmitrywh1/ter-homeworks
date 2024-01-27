output "vpc_subnet" {
  value = {
    name       = yandex_vpc_subnet.develop-02.name,
    zone       = yandex_vpc_subnet.develop-02.zone,
    network_id = yandex_vpc_subnet.develop.network_id,
    cidr       = yandex_vpc_subnet.develop.v4_cidr_blocks
    id         = yandex_vpc_subnet.develop.id
  }
}

