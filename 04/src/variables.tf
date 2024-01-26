###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###common vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "your_ssh_ed25519_key"
  description = "ssh-keygen -t ed25519"
}

###example vm_web var
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "example vm_web_ prefix"
}

###example vm_db var
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "example vm_db_ prefix"
}


# modules vm vars
variable "vm" {
  type = map(object({
    env_name       = string
    subnet_zones   = string
    instance_name  = string
    instance_count = number
    image_family   = string
    public_ip      = bool
  }))
  default = {
    marketing = {
      env_name       = "marketing"
      subnet_zones   = "ru-central1-a"
      instance_name  = "web"
      instance_count = 1
      image_family   = "ubuntu-2004-lts"
      public_ip      = true
    }
    analytics = {
      env_name       = "analytics"
      subnet_zones   = "ru-central1-a"
      instance_name  = "web"
      instance_count = 1
      image_family   = "ubuntu-2004-lts"
      public_ip      = true
    }
  }
}

# for templatefile
variable packages {
  type    = list
  default = []
}

variable userdata {
  type    = map(string)
  default = {
    username = "ubuntu"
    ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJXrG37ahpXCptSBiQG4ukIF6X+Xm6NyY0zlsUlXn0DX root@docker"
  }
}