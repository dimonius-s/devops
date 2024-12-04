resource "yandex_compute_instance" "master" {
  name        = "k8s-master"
  zone        = "ru-central1-a"
  platform_id = "standard-v2"
  resources {
    cores  = 2
    memory = 4
  }
  boot_disk {
    initialize_params {
      image_id = "fd81id4ciatai2csff2u"
      size     = 40
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }
  metadata = {
    ssh-keys  = "ubuntu:${file(var.public_key_path)}"
    user-data = file("cloud-init.yml")
  }
}

resource "yandex_compute_instance" "app" {
  name        = "k8s-app"
  zone        = "ru-central1-a"
  platform_id = "standard-v2"
  resources {
    cores  = 2
    memory = 4
  }
  boot_disk {
    initialize_params {
      image_id = "fd81id4ciatai2csff2u"
      size     = 40
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }
  metadata = {
    ssh-keys  = "ubuntu:${file(var.public_key_path)}"
    user-data = file("cloud-init.yml")
  }

}

resource "yandex_compute_instance" "srv" {
  name        = "srv-server"
  zone        = "ru-central1-a"
  platform_id = "standard-v2"
  resources {
    cores  = 2
    memory = 4
  }
  boot_disk {
    initialize_params {
      image_id = "fd81id4ciatai2csff2u"
      size     = 40
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }
  metadata = {
    ssh-keys  = "ubuntu:${file(var.public_key_path)}"
    user-data = file("cloud-init.yml")
  }
}

resource "yandex_vpc_network" "network" {
  name = "network"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.49.0/24"]
}
