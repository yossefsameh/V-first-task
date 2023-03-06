resource "google_compute_network" "my-vpc" {
  name                    = var.vpc-name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"       #Cloud Routers will learn routes only in the region in which they were created
}

resource "google_compute_firewall" "allow-in-ssh" {
  name    = "allow-in-ssh"
  network = google_compute_network.my-vpc.name
  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
  source_tags = ["myvm"]
}

resource "google_compute_firewall" "egress-deny" {
  name    = "egress-deny"
  network = google_compute_network.my-vpc.name
  #priority = 1000
  direction = "EGRESS"
  deny {
    protocol = "all"
  }
  destination_ranges = ["0.0.0.0/0"]
}