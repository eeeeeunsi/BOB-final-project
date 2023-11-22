variable "vpc_attachments" {
  description = "List of VPC attachments including VPC ID and Subnet IDs"
  type = list(object({
    vpc_id     = string
    subnet_ids = list(string)
  }))
}