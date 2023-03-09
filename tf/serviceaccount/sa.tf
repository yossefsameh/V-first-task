resource "google_service_account" "my-sa" {
  #account_id   = "mygs-sa"
  account_id   = var.account-id
  display_name = var.account-id
}
resource "google_project_iam_binding" "sa-binding" {
    role = var.binding-role
    project     = var.binding-project

    members = [
      "serviceAccount:${google_service_account.my-sa.email}",
    ]
  
}



