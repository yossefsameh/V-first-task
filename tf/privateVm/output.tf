output "myvm-private-ip" {
  value = google_compute_instance.my-vm.network_interface.0.network_ip

}