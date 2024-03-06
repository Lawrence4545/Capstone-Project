# AWS Region
variable "aws_region" {
  description = "This is the Region in which AWS Resources are going to be created"
  type        = string
}

# Environment Variable
variable "environment" {
  description = "Environment Variable is used as a prefix"
  type        = string
}

# Business Division
variable "business_division" {
  description = "Business Division This Infrastructure Belongs"
  type        = string
}