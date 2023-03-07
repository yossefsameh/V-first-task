module "mynetwork" {
  source = "./network"
  vpc-name = "my-vpc"
  subnet-name = "restricted-subnet"
  subnet-cidr = "10.0.2.0/24"
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