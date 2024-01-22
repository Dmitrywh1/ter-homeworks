
output "vm_for_each_and_count_test" {
  value = [
    for i in merge(yandex_compute_instance.db, yandex_compute_instance.web)  : {
      name = i.name
    }
  ]
}

