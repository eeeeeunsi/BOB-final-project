resource "aws_ec2_transit_gateway" "main" {
  description = "Transit Gateway created by Terraform"
}

resource "aws_ec2_transit_gateway_route_table" "main" {
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  tags = {
    Environment = "Terraform"
    Project   = "BoB-Final"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  for_each = { for idx, att in var.vpc_attachments : idx => att }

  vpc_id     = each.value.vpc_id
  subnet_ids = each.value.subnet_ids

  transit_gateway_id = aws_ec2_transit_gateway.main.id

  tags = {
    Environment = "Terraform"
    Project   = "BoB-Final"
  }
}

resource "aws_ec2_transit_gateway_route" "default_route" {
  for_each = { for idx, att in var.vpc_attachments : att.vpc_id => idx }

  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.main[each.value].id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main.id
  
  lifecycle {
    ignore_changes = [
      destination_cidr_block,
      transit_gateway_attachment_id,
      transit_gateway_route_table_id,
    ]
  }
  
}


