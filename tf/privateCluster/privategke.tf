resource "google_container_cluster" "my-private-cluster" {
  name               = var.cluster-name
  location = var.cluster-location
  network = var.cluster-vpc
  subnetwork               = var.cluster-subnet
  remove_default_node_pool = true
  initial_node_count = 1
#   node_locations = [
#     "asia-east1-b"
#   ]
  node_locations = var.node-locations

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.master-node-cidr
  }

  master_authorized_networks_config {
    cidr_blocks {
    cidr_block   = var.authorized-cidr
    display_name = "vm-private-cidr"
    }
  }
 ip_allocation_policy {
    cluster_ipv4_cidr_block  = "192.168.0.0/21"
    services_ipv4_cidr_block = "192.168.8.0/27" 
}
}

resource "google_container_node_pool" "my-pool" {
  name       = "my-pool"
  cluster    = google_container_cluster.my-private-cluster.id
  #location   =  "asia-east1-a"
  node_count = var.nodes-number-per-zone
  max_pods_per_node = 30

 node_config {
    preemptible  = false
    machine_type = var.machine-type

    service_account = var.worker-node-service-account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}