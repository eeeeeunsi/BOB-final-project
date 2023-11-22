variable "image_id" {
  description = "The image ID of AMI using EC2"
  type = string
  default = ""
}

variable "instance_name" {
  description = "The name of instacne"
  type = string
}
variable "instance_type" {
  description = "The instance type for EC2"
  type = string
}

variable "subnet_id" {
  description = "The subnet id of EC2 instance"
  type = string
}

variable "key_name" {
  description = "The public pem key of EC2 instance"
  type = string
}

variable "associate_public_ip_address" {
  description = "associate for public ip address"
  type        = bool
  default     = true
}

variable "security_groups" {
  description = "security groups for EC2 isntance"
  type = list(string)
}

variable "user_data" {
  description = "user data"
  type = string
  default = null
}