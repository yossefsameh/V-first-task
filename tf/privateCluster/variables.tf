variable cluster-name {
    type = string
}
variable cluster-location {
    type = string
}
variable cluster-vpc {
    type = string
}
variable cluster-subnet {
    type = string
}
variable node-locations {
    type = list
}
variable master-node-cidr {
    type = string
}
variable authorized-cidr {
    type = string
}
variable nodes-number-per-zone {
   type = number
}
variable machine-type {
  type= string
}
variable worker-node-service-account {
    type = string
}
