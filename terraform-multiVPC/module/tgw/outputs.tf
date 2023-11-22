output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.main.id
}

output "transit_gateway_route_table_id" {
  value = aws_ec2_transit_gateway_route_table.main.id
}

output "vpc_attachment_ids" {
  value = { for att in aws_ec2_transit_gateway_vpc_attachment.main : att.vpc_id => att.id }
}
