module "mynetwork" {
  source = "./network"
  vpc-name = "my-vpc"
  subnet-name = "restricted-subnet"
  subnet-cidr = "10.0.2.0/24"
}