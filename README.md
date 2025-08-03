```hcl
vpc = {
    cidr = "10.0.0.0/16"
    dns_support = true
    dns_hostnames = false

}

subnet = [
    { cidr = "10.0.1.0/24", az = "us-east-1a", public_ip = true, name = "subnet1" },
    { cidr = "10.0.2.0/24", az = "us-east-1b", public_ip = true, name = "subnet2" },
    { cidr = "10.0.3.0/24", az = "us-east-1c", public_ip = false, name = "subnet3" },
    { cidr = "10.0.4.0/24", az = "us-east-1e", public_ip = false, name = "subnet4" },
]

internet_gateway_name = "my-internet-gateway"

route_tables = [ "public-rt", "private-rt" ]

port = [22, 80, 443, 3306]


ec2_web = {
    ami_id = "ami-0cbbe2c6a1bb2ad63"
    type = "t2.micro"
}
