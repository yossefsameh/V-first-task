resource "google_service_account" "mygs-sa" {
  account_id   = "mygs-sa"
  display_name = "mygs-sa"
}
resource "google_project_iam_custom_role" "list-objects-role" {
  role_id     = "listobjects"
  title       = "list-objects-role"
  permissions = ["storage.objects.list"]
}
resource "google_project_iam_binding" "vm-role11" {
    role = google_project_iam_custom_role.list-objects-role.id
    #role = "roles/cloudasset.assets.listStorageBuckets"
    project     = "abdelrahman-377520"

    members = [
      "serviceAccount:${google_service_account.mygs-sa.email}",


    ]
  
}


