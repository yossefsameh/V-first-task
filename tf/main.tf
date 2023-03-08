module "mynetwork" {
  source = "./network"
  vpc-name = var.vpc-name
  subnet-name = var.subnet-name
  subnet-cidr = var.subnet-cidr
}

module "mycloudstorage" {
  source = "./cloudstorage"
  for_each = toset(var.bucket-name)
  bucket-name = each.key
  bucket-location = var.bucket-location
}

module "mybigquery" {
  source = "./bigquery"
  for_each = toset(var.dataset-name)
  dataset-name = each.key
}

module "myserviceaccount" {
  source = "./serviceaccount"
  #for_each = toset(var.account-id)
  #account-id = each-key
  count = 4
  account-id = var.account-id[count.index]
  # for_each = toset(var.role-id)
  # role-id = each.key
  # for_each = toset(var.role-permissions)
  # role-permissions = each.key
}

module "myiambinding" {
  source = "./iamBinding"
  for_each = {
  (google_project_iam_custom_role.my-custom-list-objects.id) = module.myserviceaccount[0].sa-email  
  "roles/bigquery.dataEditor" = module.myserviceaccount[1].sa-email
  "roles/container.clusterAdmin" = module.myserviceaccount[2].sa-email 
  "roles/storage.admin" = module.myserviceaccount[3].sa-email  
  }
  binding-role = each.key
  binding-member = each.value
  binding-project = var.binding-project

}


module "myprivatevm" {
  source = "./privateVm"
  vm-name = var.vm-name
  vm-zone = var.vm-zone
  vm-subnet = module.mynetwork.subnet-id
  vm-vpc = module.mynetwork.vpc-id
  vm-type = var.vm-type
  vm-os = var.vm-os
  vm-attached-sa = module.myserviceaccount[0].sa-email
}