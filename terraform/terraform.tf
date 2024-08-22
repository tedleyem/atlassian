####
#   Main section
####
variable "aws_region" {
  description = "AWS region to use"
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS profile used for deployment"
  default     = "var.aws_profile"
}

variable "pub_key_name" {
  description = "Name of the public key to install on EC2 instances"
  default     = ""
}

variable "env" {
  description = "Env where the module is deployed."
  type        = string
  default     = ""
}

variable "custom_domain" {
  description = "domain name used for public access"
  type        = string
  default     = "var.custom_domain"
}

####
#   Site related vars
####
variable "vpc_id" {
  description = "VPC ID to launch instances in"
  default     = "default"
}

variable "private_app_subnets" {
  description = "Private subnet ID(s) for application deployments"
  type = list
  default = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}

variable "private_db_subnets" {
  description = "Private subnet IDs for DB instance. At least 2 is required to make DB subnet group"
  type = list
  default = ["10.0.2.0/24", "10.0.7.0/24", "10.0.6.0/24"]
}

####
#   Bitbucket instance
####

variable "bitbucket_instance_type" {
  description = "EC2 instance type"
  default = "t2.medium"
}

variable "bitbucket_volume_size" {
  description = "Attached EBS volume size"
  default = "10"
}

variable "bitbucket_url" {
  description = "Internet facing URL"
  # default     = "var.custom_domain"
  default     = "code.$(var.custom_domain"
}

####
#   Jira instance
####

variable "jira_instance_type" {
  description = "EC2 instance type"
  default = "t2.small"
}

variable "jira_volume_size" {
  description = "Attached EBS volume size"
  default = "10"
}

variable "jira_url" {
  description = "Internet facing URL"
  default     = "jira.$(var.custom_domain"
}

####
#   Confluence instance
####

variable "confluence_instance_type" {
  description = "EC2 instance type"
  default = "t2.medium"
}

variable "confluence_volume_size" {
  description = "Attached EBS volume size"
  default = "10"
}

variable "confluence_url" {
  description = "Internet facing URL"
  default     = "wiki.$(var.custom_domain"
}

####
#   RDS instance
####

variable "db_instance_class" {
  description = "RDS instance type"
  default = "db.t2.micro"
}

variable "db_engine" {
  description = "DB engine to use"
  default = "postgres"
}

variable "db_allocated_storage" {
  description = "Amount of storage to allocate"
  default = "10"
}

variable "db_username" {
  description = "DB username"
  default     = "admin"
}

variable "db_password" {
  description = "DB password"
  default     = "secrets561"
}