variable "region" {
    description = "The AWS region to deploy the network resources."
    type        = string
    default     = ""
}

variable "cidr_block" {
    description = "The CIDR block of the VPC."
    type        = string
    default     = ""
}
  
variable "public_subnets" {
    description = "List of CIDR blocks for public subnets."
    type        = list(string)
    default     = []
}

variable "private_subnets" {
    description = "List of CIDR blocks for private subnets."
    type        = list(string)
    default     = []
}

variable "name_prefix" {
    description = "The prefix for the VPC name."
    type        = string
    default     = "Name"
  
}