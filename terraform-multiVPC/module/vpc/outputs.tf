output "vpc_id" {
  description = "vpc_id"
  value       = aws_vpc.main.id
}

output "public_subnets_ids" {
  description = "public subnets"
  value       = {for k, v in aws_subnet.public : k => v.id}
}

output "private_subnets_ids" {
  description = "private subnets"
  value       = {for k, v in aws_subnet.private : k => v.id}
}