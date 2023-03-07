resource "google_bigquery_dataset" "mydataset" {
  dataset_id                  = var.dataset-name
  #friendly_name               = "mydataset"
  location                    = "US"
}
