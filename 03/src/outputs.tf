output "vm_instances" {
  value = [
    for vm_name, vm_instance in yandex_compute_instance.db : {
      name = vm_instance.name
      id   = vm_instance.id
      fqdn = yandex_compute_instance.db[vm_name].network_interface.0.ip_address
    }
  ]
}
