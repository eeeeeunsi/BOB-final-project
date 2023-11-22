################################################################################
# Bastion Instance
################################################################################
module "bastion" {
  source        = "../module/ec2"
  instance_name = "bastion"

  instance_type   = "t2.micro"
  security_groups = [aws_security_group.bastion_sg.id]

  subnet_id                   = module.mgmt-vpc.public_subnets_ids["subnet_a1"]
  associate_public_ip_address = true
  key_name                    = "test"
}

################################################################################
# MGMT Instance
################################################################################
module "mgmt" {
  source        = "../module/ec2"
  instance_name = "mgmt"

  instance_type   = "t3.medium"
  security_groups = [aws_security_group.mgmt_sg.id]

  subnet_id                   = module.mgmt-vpc.private_subnets_ids["subnet_a1"]
  associate_public_ip_address = false
  key_name                    = "test"

  user_data = file("../script/mgmt_setup.sh")
}

################################################################################
# Bastion SG
################################################################################
resource "aws_security_group" "bastion_sg" {
  vpc_id = module.mgmt-vpc.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

################################################################################
# MGMT SG
################################################################################
resource "aws_security_group" "mgmt_sg" {
  vpc_id = module.mgmt-vpc.vpc_id
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}