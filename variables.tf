variable "region" {
  description = "AWS region"
  default     = "ca-central-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "ami" {
  description = "AMI ID"
  default     = "ami-029c5475368ac7adc"
}

variable "key_name" {
  description = "SSH key pair name for EC2"
  default     = "my-keypair"
}

variable "s3_bucket_name_prefix" {
  description = "S3 bucket name prefix"
  default     = "exam-logs"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  default     = "SessionTable"
}