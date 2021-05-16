resource "aws_instance" "awx_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.security_groups.id]
  key_name               = var.key_name
  tags = {
    Name = var.project_name
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install git python python-devel python-pip openssl ansible -y",
      "sudo amazon-linux-extras install ansible2 -y",
      "git clone https://github.com/ansible/awx.git",
      "sudo amazon-linux-extras install docker -y",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "sudo chkconfig docker on",
      "sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
      "export",
      "sudo chmod +x /usr/local/bin/docker-compose"
    ]
    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "cd awx/",
      "make docker-compose-sources",
      "docker-compose -f tools/docker-compose/_sources/docker-compose.yml up -d",
      "docker exec tools_awx_1 make clean-ui",
      "docker exec tools_awx_1 make ui-devel",
      "docker exec -ti tools_awx_1 awx-manage createsuperuser --username ${var.awx_username} --email ${var.awx_email} --noinput",
      "docker exec -ti tools_awx_1 awx-manage update_password --username ${var.awx_username} --password ${var.awx_password}"
    ]
    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key)
    }
  }
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp2" 
    tags = {
      Name    = var.project_name
    }
  }
}

resource "aws_security_group" "security_groups" {
  name        = var.project_name
  description = var.project_name
  vpc_id      = module.vpc.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_blocks
  }
  ingress {
    from_port   = 8043
    to_port     = 8043
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_blocks
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = var.project_name
  }
}