resource "google_compute_subnetwork" "restricted-subnet" {
  name          = var.subnet-name
  ip_cidr_range = var.subnet-cidr
  #region        = "asia-east1"
  region = var.subnet-region
  network       = google_compute_network.my-vpc.id
  private_ip_google_access = true
}