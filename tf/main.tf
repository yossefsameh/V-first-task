module "mynetwork" {
  source = "./network"
  vpc-name = var.vpc-name
  subnet-name = var.subnet-name
  subnet-cidr = var.subnet-cidr
  subnet-region = var.subnet-region
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
  # count = 4
  # account-id = var.account-id[count.index]
  for_each = var.account-id
  account-id = each.key
  binding-role = each.value
  binding-project = var.binding-project
}

# module "myiambinding" {
#   source = "./iamBinding"
#   for_each = {
#   (google_project_iam_custom_role.my-custom-list-objects.id) = module.myserviceaccount[0].sa-email  
#   "roles/bigquery.dataEditor" = module.myserviceaccount[1].sa-email
#   "roles/container.clusterAdmin" = module.myserviceaccount[2].sa-email 
#   "roles/storage.admin" = module.myserviceaccount[3].sa-email  
#   }
#   binding-role = each.key
#   binding-member = each.value
#   binding-project = var.binding-project
#   depends_on = [module.myserviceaccount]


# }


module "myprivatevm" {
  source = "./privateVm"
  vm-name = var.vm-name
  #vm-zone = ${var.subnet-region}-"a"
  vm-zone = "${var.subnet-region}-a"
  vm-subnet = module.mynetwork.subnet-id
  vm-vpc = module.mynetwork.vpc-id
  vm-type = var.vm-type
  vm-os = var.vm-os
  #vm-attached-sa = module.myserviceaccount[0].sa-email
  vm-attached-sa = values(module.myserviceaccount)[0].sa-email
  #vm-attached-sa = module.myserviceaccount.email-sa
  #vm-attached-sa = lookup(module.myserviceaccount.google_service_account.my-sa["clusteradmin-sa"], "email")
  #vm-attached-sa = google_service_account.mygs-sa.email

}


module "mycluster" {
  source = "./privateCluster"
  cluster-name = var.cluster-name
  cluster-location = var.cluster-location
  cluster-vpc = module.mynetwork.vpc-id
  cluster-subnet = module.mynetwork.subnet-id
  node-locations = var.node-locations
  master-node-cidr = var.master-node-cidr
  #authorized-cidr = module.myprivatevm.myvm-private-ip
  authorized-cidr = "${module.myprivatevm.myvm-private-ip}/32"
  nodes-number-per-zone = var.nodes-number-per-zone
  machine-type = var.machine-type
  worker-node-service-account = values(module.myserviceaccount)[2].sa-email

}