output "vm_for_each_and_count_test" {
  value = merge(
    { for i in yandex_compute_instance.db : i => {
        name = i.name
        id   = i.id
        fqdn = i.fqdn
      }
    },
    { for i in yandex_compute_instance.web : i => {
        name = i.name
        id   = i.id
        fqdn = i.fqdn
      }
    }
  )
}
