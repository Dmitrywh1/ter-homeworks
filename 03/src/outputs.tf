output "vm_for_each_and_count_test" {
  value = merge(
    { for map, list in yandex_compute_instance.db : map => {
        name = list.name
        id   = list.id
        fqdn = list.fqdn
      }
    },
    { for map, list in yandex_compute_instance.web : vm_name => {
        name = list.name
        id   = list.id
        fqdn = list.fqdn
      }
    }
  )
}
