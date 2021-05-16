# terraform_awx


1) Entrar a la consola de aws, crear una bucket S3 y reemplazar en "backend.tf" los siguientes campos con el 
nombre de dicha bucket:

* resource -> aws_s3_bucket -> terraform_state -> bucket = "nombre la bucket s3 que acabamos de crear".
* resource -> aws_dynamodb_table -> terraform_state_lock -> name = "nombre la bucket s3 que acabamos de crear".
* terraform -> bucket = "nombre la bucket s3 que acabamos de crear".
* terraform -> dynamo_table = "nombre la bucket s3 que acabamos de crear".

Esto va a configurar nuestro terraform state lock.

2) En backend.tf reemplazar el campo:

* terraform -> profile = "el nombre de el profile donde esten configuradas nuestras keys de AWS".

3) crear una .pem key en la consola de EC2 y descargarla. Usaremos esta .pem para hacer que remote_exec instale paquetes en la 
instancia y para que luego podamos entrar por ssh a la misma.

4) completar los campos de variables en "terraform.tfvars".

5) ejecutar en la terminal los siguientes comandos de terraform:

terraform init
terraform plan -lock=false
terraform apply -lock=false

El flag -lock=false en necesario solo la primera vez que se ejecute el terraform plan y apply. Luego pueden ejecutarse cambios usando solo:

terraform init
terraform plan
terraform apply

Y esperar aproximadamente entre 10 y 20 minutos que termine de provisionar y configurar la instancia.

6) AWX puede ser accedido por el puerto 8043 de la instancia EC2 provisionada.