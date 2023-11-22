/*----------------amazon linux 2023-----------------*/
data "aws_ami" "amzn2023" {
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-6.1-x86_64"]
  }

  owners = ["137112412989"]

}

/*----------------amazon linux 2-----------------*/
data "aws_ami" "amzn2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*.*-x86_64-gp2"]
  }

  owners = ["137112412989"]

}

/*----------------ubuntu 22.04-----------------*/
data "aws_ami" "ubuntu2204" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]

}

/*----------------ubuntu 20.04-----------------*/
data "aws_ami" "ubuntu2004" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]

}