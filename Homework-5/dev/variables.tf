
variable vpc_cidr {
    type = string
    description = "CIDR block for the VPC"
  }

variable subnet_cidrs {
  type = list(string)
  description = "List of CIDR blocks for the subnets"
}
  
variable azs {
  type = list(string)
  description = "List of Availability Zones for the subnets"
}

variable environment {
  type = string
  description = "Environment tag"
}


variable ami_id {
    type = string
    description = "AMI id for the instance"
}

variable instance_type {
    type = string
    description = "Instance type"

}
