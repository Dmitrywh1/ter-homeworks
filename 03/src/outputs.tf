output "vm_for_each_and_count_test" {
  value = merge(
    { for map, list in yandex_compute_instance.db : map => {
        name = list.name
        id   = list.id
        fqdn = list.fqdn
      }
    },
    { for map, list in yandex_compute_instance.web : map => {
        name = list.name
        id   = list.id
        fqdn = list.fqdn
      }
    }
  )
}

output "just_test" {
  value = [
    for i, a in var.instance_configurations_1 : {
      name = a.name
      ami = a.ami_id
    }
  ]
}
