data "yandex_compute_image" "centos7" {
  family = var.os_image_web
}

resource "yandex_compute_instance" "centos7" {
  name        = "${var.yandex_compute_instance_web[0].vm_name}-${count.index + 1}"
  platform_id = var.yandex_compute_instance_web[0].platform_id

  count = var.yandex_compute_instance_web[0].count_vms

  resources {
    cores         = var.yandex_compute_instance_web[0].cores
    memory        = var.yandex_compute_instance_web[0].memory
    core_fraction = var.yandex_compute_instance_web[0].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos7.image_id
      type     = var.boot_disk_web[0].type
      size     = var.boot_disk_web[0].size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  scheduling_policy {
    preemptible = true
  }

  metadata = {
    serial-port-enable = local.vms_metadata.serial-port-enable
    ssh-keys           = local.vms_metadata.ssh-keys
  }
}
