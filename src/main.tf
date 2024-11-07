resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

################ vm web ######################


resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone.a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr.a
}

data "yandex_compute_image" "ubuntu" {
  family = var.image.web
}

resource "yandex_compute_instance" "platform" {
  name        = local.web_name
  platform_id = var.platform.3
  resources {
    cores         = var.vm_param.web.cores
    memory        = var.vm_param.web.memory
    core_fraction = var.vm_param.web.core_fract
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = local.vms_ssh_root_key.serial_port.stat
    ssh-keys           = local.vms_ssh_root_key.ssh.key
  }

}


#################### vm db ##########################


resource "yandex_vpc_subnet" "db-develop" {
  name           = var.db_subnet_name
  zone           = var.default_zone.b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr.b
}

data "yandex_compute_image" "db-ubuntu" {
  family = var.image.db
}

resource "yandex_compute_instance" "db-platform" {
  name        = local.db_name
  platform_id = var.platform.3
  zone = var.default_zone.b
  resources {
    cores         = var.vm_param.db.cores
    memory        = var.vm_param.db.memory
    core_fraction = var.vm_param.db.core_fract
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.db-ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db-develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = local.vms_ssh_root_key.serial_port.stat
    ssh-keys           = local.vms_ssh_root_key.ssh.key
  }

}


