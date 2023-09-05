# module "ec2_instance" {
#   source = "terraform-aws-modules/ec2-instance/aws"

#   name = "spot-instance"

#   create_spot_instance = false
#   spot_price           = "0.60"
#   spot_type            = "persistent"
#   ami                  = data.aws_ami.ubuntu.id
#   instance_type        = var.instType
#   key_name             = "gaction1"

#   root_block_device = [
#     {
#       volume_size = "20"
#       volume_type = "gp2"
#     }
#   ]

#   # provisioner "local-exec" {
#   #   command = "ls -la ../"
    
#   # }

# # user_data = file("../scripts/microk8s.sh")

# # user_data = data.external.microk8s_script.result

#   # connection {
#   #   host = self.public_ip
#   #   type = "ssh"
#   #   private_key = file("./mykey.pem")
#   #   user = "ubuntu"
#   # }
#   # provisioner "remote-exec" {
#   #   inline = [
#   #     file("../scripts/microk8s.sh")
#   #   ]
#   # }

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#     Name        = "${var.product}-${var.env}-master-ec2"
#   }
# }


resource "aws_instance" "master" {
  
   ami = data.aws_ami.ubuntu.id
   instance_type = var.instType
   key_name = "gaction1"


  # root_block_device = [
  #   {
  #     volume_size = "10"
  #     volume_type = "gp2"
  #   }
  # ]

  user_data = file("scripts/microk8s.sh")

  # provisioner "local-exec" {
  #   command = "ls -la ../"
  # }

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "${var.product}-${var.env}-master-ec2"
  }


}

