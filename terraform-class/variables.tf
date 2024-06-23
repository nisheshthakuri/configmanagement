variable "ami_id" {
  description = "The AMI ID"
}

variable "key_name" {
  description = "The name of your SSH key pair."
}

variable "instance_type" {
  description = "The EC2 instance type."
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "The ID of the VPC where you want to launch the instance."
}

variable "instance_count" {
  default = "2"
}

variable "subnet_id" {
  description = "The ID of the subnet within the VPC."
}

variable "storage_size" {
  description = "The size of the root EBS volume in GB."
  default     = 8
}
