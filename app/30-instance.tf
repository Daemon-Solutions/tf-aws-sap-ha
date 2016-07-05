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
    Name        = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}"
    Environment = "${var.envname}"
    Service     = "${element(split(",",var.app_names),0)}"
  }
}
