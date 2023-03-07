resource "google_storage_bucket" "my-iti-bucket" {
  name          = var.bucket-name
  location      = var.bucket-location
  storage_class = "STANDARD"
  
}