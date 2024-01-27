output "VPC_Subnet" {
  value = [
    yandex_vpc_subnet.develop.name,
    yandex_vpc_subnet.develop.zone,
    yandex_vpc_subnet.develop.network_id,
    yandex_vpc_subnet.develop.v4_cidr_blocks,
  ]
}

