variable "virginia_cidr" {
  description = "CIDR block for the Virginia VPC"
  # type        = map(string)
  type = string
}

variable "virginia_tags" {
  description = "Tags to apply to the Virginia VPC"
  type        = map(string)
  default = {
    Name = "VPC_VIRGINIA"
    cloud = "AWS"
    IAC = "Terraform"
    IAC_Version = "1.12.2"
    region = "virginia"
    env  = "Dev"
    name = "prueba"
    project = "cerberus"
  }
}

# variable "public_subnet" {
#   description = "CIDIR public subnet"
#   type        = string
# }

# variable "private_subnet" {
#   description = "CIDR private subnet"
#   type        = string
# }

variable "subnets" {
  description = "List of subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags of project"
  type        = map(string)
}

variable "sg_ingress_cdir" {
  description = "CDIR for ingress traffic"
  type        = string

}

variable "ec2_specs" {
  description = "EC2 instance specifications"
  type        = map(string)
}

variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  type = bool
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    cidr        = string
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
    name        = string
  }))
}

variable "access_key" {}

variable "secret_key" {}