######Network Module
vpc-name = "my-vpc"
subnet-name = "restricted-subnet"
subnet-cidr = "10.0.2.0/24"
subnet-region = "us-central1"

#######gs module 
bucket-name = ["my-iti-bucket", "my-iti-bucket2","my-iti-bucket3"]
bucket-location = "US"

###### bq module
dataset-name = ["fstdataset","scddataset","thirddataset"]


####### vm module
vm-name         = "my-vm"
vm-type = "n1-standard-1"
vm-zone         = "asia-east1-b"
vm-os = "debian-cloud/debian-11"

######### sa module
#account-id = ["mygs-sa","mybigquery-sa","clusteradmin-sa","storageadmin-sa"]
binding-project = "abdelrahman-377520"
account-id ={
 
"mybigquery-sa" =  "roles/bigquery.dataEditor"
 
"clusteradmin-sa" = "roles/container.admin"
 
"storageadmin-sa" = "roles/storage.admin"
 
}


########cluster module
cluster-name = "my-private-cluster"
cluster-location = "us-central1-c"
#node-locations = ["us-central1-c","us-central1-f"]
node-locations = ["us-central1-f"]
master-node-cidr = "172.16.0.0/28"
nodes-number-per-zone = 1
machine-type = "e2-standard-2"