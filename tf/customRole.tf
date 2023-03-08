resource "google_project_iam_custom_role" "my-custom-list-objects" {
  role_id     = "listobjects"
  #role_id     = var.role-id
  title       = "list-objects-role"
  #title        = var.role-id
  #permissions  = var.role-permissions
  permissions = ["storage.objects.list"]
}

# resource "google_project_iam_binding" "vm-role11" {
#     #role = google_project_iam_custom_role.my-custom-role.id
#     #role = "roles/cloudasset.assets.listStorageBuckets"
#     role = "roles/container.admin"

#     project     = "abdelrahman-377520"

#     members = [
#       "serviceAccount:${google_service_account.my-sa.email}",


#     ]
  
# }