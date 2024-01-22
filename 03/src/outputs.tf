output "vm_for_each_and_count" {
  value = [
    for vm_name, vm_instance in yandex_compute_instance.db : {
      name = vm_instance.name
      id   = vm_instance.id
      fqdn = yandex_compute_instance.db[vm_name].network_interface.0.ip_address
    }
  ]
}

output "vm_for_each_and_count_test" {
  value = [
    for i in merge(yandex_compute_instance.db, yandex_compute_instance.db)  : {
      name = i.name
    }
  ]
}

