resource "google_compute_router" "router" {
  name    = "router"
  region  = google_compute_subnetwork.restricted-subnet.region
  network = google_compute_network.my-vpc.id
}

resource "google_compute_router_nat" "my-nat" {
  name                               = "my-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  #source_ip_ranges_to_nat            = "ALL_IP_RANGES"
  #source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.restricted-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}