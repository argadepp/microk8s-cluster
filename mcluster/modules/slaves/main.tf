resource "aws_launch_template" "slaves" {
  image_id = data.aws_ami.ubuntu.id
  name = "${var.product}-${var.environment}-lt"
  instance_type = var.instanceType
  key_name = "packer"
  user_data  = base64encode(file("scripts/slave-node.sh"))
  block_device_mappings {
    device_name = "/dev/xvda" # Root volume
    ebs {
      volume_size           = 20 # Size in GiB
      volume_type           = "gp3"
      delete_on_termination = true
    }
  } 

  tags = {
    Name = ""
  }
}

resource "aws_autoscaling_group" "slave-nodes" {
  launch_template {
    id = aws_launch_template.slaves.id
    version = "$Latest"
  }
  min_size = var.min
  desired_capacity = var.desired
  max_size = var.max

  availability_zones = ["ap-south-1a","ap-south-1b"]
  }

