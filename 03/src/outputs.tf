output "vm_for_each_and_count_test" {
  value = merge(
    { for i in yandex_compute_instance.db : vm_name => {
        name = i.name
        id   = i.id
        fqdn = i.fqdn
      }
    },
    { for i in yandex_compute_instance.web : vm_name => {
        name = i.name
        id   = i.id
        fqdn = i.fqdn
      }
    }
  )
}
