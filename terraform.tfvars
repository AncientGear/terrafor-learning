virginia_cidr = "10.10.0.0/16"
# virginia_cidr = {
#   "prod" = "10.10.0.0/16"
#   "dev" = "172.16.0.0/16"
# }
# public_subnet  = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"

subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  "env" : "dev"
  "owner" : "saul y yuli"
  "cloud" : "AWS"
  "IAC" : "Terraform"
  "IAC_VERSION" : "1.12.2"
}

sg_ingress_cdir = "0.0.0.0/0"

ec2_specs = {
  "ami"           = "ami-0150ccaf51ab55a51"
  "instance_type" = "t2.micro"

}

enable_monitoring = false

ingress_rules = [
    {
      cidr        = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH access"
      name        = "allow-ssh"
    },
    {
      cidr        = "10.0.0.0/16"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP access from VPC"
      name        = "allow-http-vpc"
    }
  ]
