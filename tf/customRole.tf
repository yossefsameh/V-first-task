resource "google_service_account" "mygs-sa" {
  account_id   = "mygs-sa"
  display_name = "mygs-sa"
}
resource "google_project_iam_custom_role" "my-custom-list-objects" {
  role_id     = "listobjects"
  #role_id     = var.role-id
  title       = "list-objects-role"
  #title        = var.role-id
  #permissions  = var.role-permissions
  permissions = ["storage.objects.list"]
}

resource "google_project_iam_binding" "gs-binding" {
    role = google_project_iam_custom_role.my-custom-list-objects.id
 

    project     = "abdelrahman-377520"

    members = [
      "serviceAccount:${google_service_account.mygs-sa.email}",


    ]
  
}