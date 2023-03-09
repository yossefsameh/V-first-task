variable vpc-name {
  type        = string
  default     = "my-vpc"
}
variable subnet-name {
  type        = string
  default     = "restricted-subnet"
}
variable subnet-cidr {
  type        = string
  default     = "10.0.2.0/24"
}

variable subnet-region {
  type        = string
}
