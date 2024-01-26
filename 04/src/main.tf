#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop" {
  name           = "develop-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

module "marketing" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=1.0.0"
  env_name       = var.vm.analytics.env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.vm.analytics.subnet_zones]
  subnet_ids     = [yandex_vpc_subnet.develop.id]
  instance_name  = var.vm.analytics.instance_name
  instance_count = var.vm.analytics.instance_count
  image_family   = var.vm.analytics.image_family
  public_ip      = var.vm.analytics.public_ip

   labels = {
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "analytics" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=1.0.0"
  env_name       = var.vm.marketing.env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.vm.marketing.subnet_zones]
  subnet_ids     = [yandex_vpc_subnet.develop.id]
  instance_name  = var.vm.marketing.instance_name
  instance_count = var.vm.marketing.instance_count
  image_family   = var.vm.marketing.image_family
  public_ip      = var.vm.marketing.public_ip

   labels = {
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

data template_file "userdata" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    username           = var.userdata.username
    ssh_public_key     = file(var.userdata.ssh_public_key)
#    packages           = jsonencode(var.packages)
  }
}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
}

