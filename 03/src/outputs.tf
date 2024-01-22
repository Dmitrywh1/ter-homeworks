output "vm_list" {
  value = merge([
    for idx, vm in yandex_compute_instance.db : {
      name = vm.name
      id   = vm.id
      fqdn = vm.network_interface.0.ip_address
    }
  ] + [
    for idx, vm in yandex_compute_instance.web : {
      name = vm.name
      id   = vm.id
      fqdn = vm.network_interface.0.ip_address
    }
  ]...)
}
