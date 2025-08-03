provider aws {
    region = "us-east-2"
}

module vpc {
    source = "../vpc"
    vpc_cidr = var.vpc_cidr
    subnet_cidrs = var.subnet_cidrs
    azs = var.azs
    environment = var.environment
}

module ec2_1 {
    source = "../ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    environment = "${var.environment}-web1"
}

module ec2_2 {
    source = "../ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    environment = "${var.environment}-web2"
}

module ec2_3 {
    source = "../ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    environment = "${var.environment}-web3"
}