resource "aws_instance" "app" {
  count                       = "${var.create_ha + 1}"
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${element(split(",",var.instance_subnets),count.index)}"
  ebs_optimized               = "${var.ebs_optimised}"
  key_name                    = "${var.key_name}"
  iam_instance_profile        = "${var.iam_instance_profile}"
  disable_api_termination     = "${var.termination_protection}"
  ebs_optimized               = "${var.ebs_optimised}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  user_data                   = "${element(template_file.user_data.*.rendered,count.index)}"
  vpc_security_group_ids      = ["${split(",", var.security_groups)}"]

  root_block_device {
    volume_size = "${var.root_volume_size}"
  }

  tags {
    Name        = "${var.project_prefix}-${var.envname}-${var.app_name}"
    Environment = "${var.envname}"
    Service     = "${var.app_name}"
  }
}

resource "aws_ebs_volume" "swap" {
  count             = "${var.create_ha + 1}"
  size              = "${lookup(var.swap_sizes,var.instance_type)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "gp2"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${var.app_name}-${format("%02d",count.index+1)}-swap"
    For  = "${var.app_name}-${format("%02d",count.index+1)}:swap"
  }
}
