variable vpc {
    type = object({
    cidr = string
    dns_support = bool
    dns_hostnames = bool
  })
  default = {
    cidr = ""
    dns_support = true
    dns_hostnames = false
  }
}

variable subnet {
  type = list(object({
    cidr = string
    az = string
    public_ip = bool 
    name = string

  }))
  default = [
    {
    cidr = ""
    az = ""
    public_ip = true
    name = ""
  },
    {
    cidr = ""
    az = ""
    public_ip = true
    name = ""
  },
    {
    cidr = ""
    az = ""
    public_ip = false
    name = ""
  },
  {
    cidr = ""
    az = ""
    public_ip = false
    name = ""
  }
  ]
}
  
variable "internet_gateway_name" {
  description = "Name tag for the Internet Gateway"
  type        = string
}

variable route_tables {
  type = list(string)
  description = "List of route table names"
}

variable port {
  type = list(number)
  description = "Provide port"
}


variable ec2_web {
  type=map(string)
}
