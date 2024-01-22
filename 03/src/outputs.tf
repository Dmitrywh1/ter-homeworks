
output "vm_for_each_and_count_test" {
  value = merge(
    [
      for vm_name, vm_instance in yandex_compute_instance.db : {
        name = vm_instance.name
        id   = vm_instance.id
        fqdn = yandex_compute_instance.db[vm_name].network_interface.0.ip_address
      }
    ],
    [
      for vm_name, vm_instance in yandex_compute_instance.web : {
        name = vm_instance.name
        id   = vm_instance.id
        fqdn = yandex_compute_instance.web[vm_name].network_interface.0.ip_address
      }
    ]
  )
}

