resource "google_compute_instance" "my-vm" {
  name         = var.vm-name
  machine_type = var.vm-type
  zone         = var.vm-zone
  tags = [var.vm-name]
  allow_stopping_for_update = true 
  boot_disk {
    initialize_params {
      image = var.vm-os
    }
  }
  network_interface {
    network = var.vm-vpc
    subnetwork = var.vm-subnet
   
  }
  service_account {
    email  = var.vm-attached-sa
    scopes = ["cloud-platform"]
  }
}

