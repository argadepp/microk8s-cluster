module "ec2_instance_slave" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "slave-instance"

  create_spot_instance = false
  spot_price           = "0.60"
  spot_type            = "persistent"
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = var.instType
  key_name             = aws_key_pair.helm_key.key_name

  root_block_device = [
    {
      volume_size = "10"
      volume_type = "gp2"
    }
  ]

  user_data = file("../../scripts/slave-node.sh")
  #   monitoring             = true
  #   vpc_security_group_ids = ["sg-12345678"]
  #   subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "${var.product}-${var.env}-slave-ec2"
  }
}