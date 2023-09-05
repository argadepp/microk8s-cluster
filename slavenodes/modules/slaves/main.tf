
resource "aws_instance" "master" {
  
   ami = data.aws_ami.ubuntu.id
   instance_type = var.instType
   key_name = "gaction1"



  connection {
    host = self.public_ip
    type = "ssh"
    private_key = file("modules/scripts/id_rsa")
    user = "ubuntu"
  }
  provisioner "remote-exec" {
    inline = [
      file("modules/scripts/microk8s.sh")
    ]
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "${var.product}-${var.env}-master-ec2"
  }


}

resource "aws_launch_template" "microk8s-slave-nodes-template" {
  name_prefix              = "${var.product}-${var.env}-asg-template"
  description              = "Slave Nodes"
  version_description      = "Version 1"
  instance_type            = var.instType
  key_name                 = "gaction1"
  user_data                = file("modules/scripts/slave-node.sh")

  # You can specify additional instance configuration here

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.product}-${var.env}-asg-ec2"
    }
  }
}

resource "aws_autoscaling_group" "microk8s-asg" {
  name                      = "${var.product}-${var.env}-asg"
  launch_template {
    id                       = aws_launch_template.microk8s-slave-nodes-template.id
    version                  = "$Latest"
  }
  min_size                  = var.min
  max_size                  = var.max
  desired_capacity          = var.dz
  vpc_zone_identifier       = ["subnet-0642101628122b197", "subnet-010c9e5041538922b"]
  # Other ASG configuration options
}