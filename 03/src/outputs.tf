output "vm_for_each_and_count_test" {
  value = merge(
    { for macro, mini in yandex_compute_instance.db : macro => {
        name = mini.name
        id   = mini.id
        fqdn = mini.fqdn
      }
    },
    { for macro, mini in yandex_compute_instance.web : macro => {
        name = mini.name
        id   = mini.id
        fqdn = mini.fqdn
      }
    }
  )
}

