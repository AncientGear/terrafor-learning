# # ami-0150ccaf51ab55a51

# variable "instancias" {
#   description = "Instances Names"
#   type        = set(string)
#   default     = ["apache", "mysql", "mysql"]
# }

# resource "aws_instance" "public_instance" {
#   for_each               = var.instancias
#   ami                    = var.ec2_specs.ami
#   instance_type          = var.ec2_specs.instance_type
#   subnet_id              = aws_subnet.public_subnet.id
#   key_name               = data.aws_key_pair.ec2_key.key_name
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
#   user_data              = file("./scripts/user_data.sh")
#   tags = {
#     Name = each.value
#   }
# }

variable "instancias" {
  description = "Instances Names"
  type        = list(string)
  default     = ["apache"]
}

resource "aws_instance" "public_instance" {
  for_each               = toset(var.instancias)
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("./scripts/user_data.sh")
  tags = {
    Name = "${each.value}-${local.sufix}"
  }
}

variable "cadena" {
  type = string
  default = "ami-123,AMI-AAB,aMI-12f"
}

resource "aws_instance" "monitoring_instance" {
  count = var.enable_monitoring ? 1 : 0
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("./scripts/user_data.sh")
  tags = {
    Name = "Monitoreo-${local.sufix}"
  }
}
