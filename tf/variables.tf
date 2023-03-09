##########network module
variable vpc-name {
  type        = string
}
variable subnet-name {
  type        = string
}
variable subnet-cidr {
  type        = string
}
variable subnet-region {
  type        = string
}


########## gs module
variable bucket-name {
  
}
variable bucket-location {
  type        = string
}


######### bq module
variable dataset-name {
}



#########vm module
variable vm-name {
  type        = string
}
variable vm-zone {
  type        = string
}
variable vm-os {
  type        = string
}
variable vm-type {
  type        = string
}



#########sa module
variable account-id {
}


variable binding-project {

}


#########cluster module
variable cluster-name {
    type = string
}
variable cluster-location {
    type = string
}
variable master-node-cidr {
    type = string
}
variable node-locations {
    type = list
}
variable nodes-number-per-zone {
   type = number
}
variable machine-type {
  type= string
}
