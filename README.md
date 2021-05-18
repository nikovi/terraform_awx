# terraform_awx


1) Enter the aws console, create an S3 bucket and replace in "backend.tf" the following fields with the
name of said bucket:

* resource -> aws_s3_bucket -> terraform_state -> bucket = "The name of the s3 bucket we just created".
* resource -> aws_dynamodb_table -> terraform_state_lock -> name = "The name of the s3 bucket we just created".
* terraform -> bucket = "The name of the s3 bucket we just created".
* terraform -> dynamo_table = "The name of the s3 bucket we just created".

This will configure our terraform state lock.

2) In backend.tf replace the field:

* terraform -> profile = "the name of the profile where our AWS keys are configured".

3) Create a .pem key in the EC2 console and download it. We will use this .pem to make remote_exec install packages in the
instance and so that later we can enter by ssh to it.

4) Fill in the variable fields in "terraform.tfvars".


5) Run the following terraform commands in the terminal:

terraform init
terraform plan -lock=false
terraform apply -lock=false

The -lock = false flag is required only the first time the terraform plan and apply is executed. After that changes can then be executed using just:

terraform init
terraform plan
terraform apply

And wait approximately 10-20 minutes for it to finish provisioning and configuring the instance.

6) AWX can be accessed through port 8043 of the provisioned EC2 instance.