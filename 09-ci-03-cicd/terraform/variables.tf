###cloud vars
variable "yc_token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "yc_cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "yc_folder_id" {
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

variable "os_image_web" {
  type    = string
  default = "centos-7"
}

variable "yandex_compute_instance_web" {
  type = list(object({
    vm_name       = string
    cores         = number
    memory        = number
    core_fraction = number
    count_vms     = number
    platform_id   = string
  }))
  default = [{
    vm_name       = "centos7"
    cores         = 2
    memory        = 4
    core_fraction = 5
    count_vms     = 2
    platform_id   = "standard-v1"
  }]
}

variable "boot_disk_web" {
  type = list(object({
    size = number
    type = string
  }))
  default = [{
    size = 20
    type = "network-hdd"
  }]
}

###ssh
variable "vm_username" {
  type        = string
  default     = "centos"
  description = "Username for the VM"
}
