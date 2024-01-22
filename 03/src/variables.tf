###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  default     = ""
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = ""
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

variable "vm_web_yandex_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image OC"
}

variable "instance_configurations_1" {
  type = list(map(string))

  default = [
    {
      name        = "web-server"
      instance_type = "t2.micro"
      ami_id      = "ami-0abc123"
    },
    {
      name        = "database-server"
      instance_type = "t2.large"
      ami_id      = "ami-1def456"
    }
  ]
}

variable "instance_configurations_2" {
  type = list(map(string))

  default = [
    {
      name        = "web-server_2"
      instance_type = "t2.micro"
      ami_id      = "ami-0abc123"
    },
    {
      name        = "database-server_2"
      instance_type = "t2.large"
      ami_id      = "ami-1def456"
    }
  ]
}
