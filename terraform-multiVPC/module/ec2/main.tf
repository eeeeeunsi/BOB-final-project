resource "aws_instance" "main" {
  ami             = coalesce(var.image_id, data.aws_ami.amzn2.id)
  instance_type   = var.instance_type
  security_groups = var.security_groups

  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name

  user_data = var.user_data

  tags = {
    Name = var.instance_name
    Environment = "Terraform"
    Project   = "BoB-Final"
  }
}