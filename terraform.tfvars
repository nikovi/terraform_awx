###CUENTA AWS###
aws_profile    =  #Profile de aws configure (string)
region         =  #region definida en aws configure (string)
  
###VPC###
project_name   = #nombre de el proyecto (string) 
azs            = #availavility zones (list)
cidr           = #CIDR VPC (list)
public_subnets = #rangos de subnet publica (list)


###EC2###
ami            = #Amazon machine image, debe ser amazon linux o centos(RHEL) (string)
instance_type  = #Tipo de instancia. Recomendado un tipo de instancia de mas de 2 cores y 4gb de ram (string)
key_name       = #nombre de la pemkey que va a ser asociada a la instancia, debe ser creada y descargada previamente desde la consola de AWS(string)
private_key    = #path local de la pemkey asociada a la instancia para el remote_exec(string)
volume_size    = #tamano de el root volume de la instancia (number)

###SG###
sg_cidr_blocks = #ips para security groups (list)

###AWX###
awx_username   = #usuario admin para awx (string)
awx_email      = #email de usuario admin. En caso de no tener uno completar con un email cualquiera, pero no dejar vacio (string)
awx_password   = #contrasena de usuario admin (string)
