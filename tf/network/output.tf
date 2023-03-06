output vpc-id {
  value       = google_compute_network.my-vpc.id
}
output subnet-id {
  value       = google_compute_subnetwork.restricted-subnet.id
}