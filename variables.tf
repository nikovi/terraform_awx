###CUENTA AWS###
variable "aws_profile" {
  description = ""
  type        = string
}

variable "region" {
  description = ""
  type        = string
}

###VPC###
variable "project_name" {
  description = ""
  type        = string
}

variable "azs" {
  description = ""
  type        = list(string)
}

variable "cidr" {
  description = ""
  type        = list(string)
}

variable "public_subnets" {
  description = ""
  type        = list(string)
}

###EC2###

variable "ami" {
  description = ""
  type        = string
}

variable "instance_type" {
  description = ""
  type        = string
}

variable "key_name" {
  description = ""
  type        = string
}

variable "private_key" {
  description = ""
  type        = string
}

variable "volume_size" {
  description = ""
  type        = number
}

###SG###
variable "sg_cidr_blocks" {
  description = ""
  type        = list(string)
}

###AWX###

variable "awx_username" {
  description = ""
  type        = string
}

variable "awx_email" {
  description = ""
  type        = string
}

variable "awx_password" {
  description = ""
  type        = string
}
