###AWS ACCOUNT###
aws_profile    =  # Profile of aws configure (string)
region         =  # Region defined in aws configure (string)
  
###VPC###
project_name   = # Project name (string) 
azs            = # Availavility zones (list)
cidr           = # CIDR VPC (list)
public_subnets = # CIDR public subnets (list)


###EC2###
ami            = # Amazon machine image, must be amazon linux or centos (RHEL) (string)
instance_type  = # Instance type. Recommended an instance type of more than 2 cores and 4gb of ram (string)
key_name       = # Name of the pemkey that will be associated with the instance, it must be previously created and downloaded from the AWS console (string)
private_key    = # Local path of the pemkey associated with the instance for the remote_exec (string)
volume_size    = # Size of the root volume of the instance (number)

###SG###
sg_cidr_blocks = # CIDR ranges for the security groups (list)

###AWX###
awx_username   = # Username for the admin user of awx (string)
awx_email      = # Email of the admin user. In case of not having one, complete with any email, but do not leave empty (string)
awx_password   = # Password of the admin user of awx (string)
