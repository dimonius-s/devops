output "master_ip" {
  value = yandex_compute_instance.master.network_interface[0].nat_ip_address
}

output "app_ip" {
  value = yandex_compute_instance.app.network_interface[0].nat_ip_address
}

output "srv_ip" {
  value = yandex_compute_instance.srv.network_interface[0].nat_ip_address
}
