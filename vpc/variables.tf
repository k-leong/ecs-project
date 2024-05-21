variable "public_subnets" {
  type = map(object({
    cidr_block = string
    availability_zone = string 
  }))
  default = {
    "public1" = {
      cidr_block        = "172.50.0.0/24"
      availability_zone = "us-west-1b"
    }
    "public2" = {
      cidr_block        = "172.50.30.0/24"
      availability_zone = "us-west-1c"
    }
  }
}