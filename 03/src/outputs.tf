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
    for i in merge(var.instance_configurations_1,var.instance_configurations_2) : {
      name = i.name
      ami = i.ami_id
    }
  ]
}
