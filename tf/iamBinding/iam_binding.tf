resource "google_project_iam_binding" "clusteradmin-binding" {
    role = var.binding-role
    project     = var.binding-project

    members = [
      "serviceAccount:${var.binding-member}",
    ]
  
}

# resource "google_project_iam_member" "firestore_owner_binding" {
#   role = "roles/container.admin"

#   project     = "abdelrahman-377520"

#   member  = "serviceAccount:${google_service_account.my-sa.email}"
# }