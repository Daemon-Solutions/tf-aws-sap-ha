resource "aws_instance" "instance_snap" {
  count                       = "${var.use_ebs_snapshots * (var.create_ha + 1)}"
  ami                         = "${var.ami_id}"
  instance_type               = "${element(split(",",var.instance_type),count.index)}"
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
    volume_type = "gp2"
  }

  # Swap
  ebs_block_device {
    volume_size = "${var.ebs_swap_size}"
    device_name = "xvdb"
    volume_type = "gp2"
    snapshot_id = "${element(split(",",var.ebs_snapshots),0)}"
  }

  # /usr/sap
  ebs_block_device {
    volume_size = "${var.ebs_usr_sap_size}"
    device_name = "xvdh"
    volume_type = "gp2"
    snapshot_id = "${element(split(",",var.ebs_snapshots),1)}"
  }

  # /usr/sap/[sid]
  ebs_block_device {
    volume_size = "${var.ebs_usr_sap_sid_size}"
    device_name = "xvdi"
    volume_type = "gp2"
    snapshot_id = "${element(split(",",var.ebs_snapshots),2)}"
  }

  # /sapmnt
  ebs_block_device {
    volume_size = "${var.ebs_sapmnt_size}"
    device_name = "xvdk"
    volume_type = "gp2"
    snapshot_id = "${element(split(",",var.ebs_snapshots),3)}"
  }

  # sybase
  ebs_block_device {
    volume_size = "${var.ebs_sybase_size}"
    device_name = "xvdm"
    volume_type = "gp2"
    snapshot_id = "${element(split(",",var.ebs_snapshots),4)}"
  }

  # sapdata_1
  ebs_block_device {
    volume_size = "${var.ebs_sapdata_size}"
    device_name = "xvdn"
    volume_type = "gp2"
    snapshot_id = "${element(split(",",var.ebs_snapshots),5)}"
  }

  # sapdata_1
  ebs_block_device {
    volume_size = "${var.ebs_sapdata_size}"
    device_name = "xvdo"
    volume_type = "gp2"
    snapshot_id = "${element(split(",",var.ebs_snapshots),6)}"
  }

  # sapdata_2
  ebs_block_device {
    volume_size = "${var.ebs_sapdata_size}"
    device_name = "xvdp"
    volume_type = "gp2"
    snapshot_id = "${element(split(",",var.ebs_snapshots),7)}"
  }

  # sapdata_3
  ebs_block_device {
    volume_size = "${var.ebs_sapdata_size}"
    device_name = "xvdq"
    volume_type = "gp2"
    snapshot_id = "${element(split(",",var.ebs_snapshots),8)}"
  }

  # saplog_4
  ebs_block_device {
    volume_size = "${var.ebs_saplog_size}"
    device_name = "xvdr"
    volume_type = "gp2"
    snapshot_id = "${element(split(",",var.ebs_snapshots),9)}"
  }

  tags {
    Name        = "${var.project_prefix}-${var.envname}-${var.app_stack}_${var.app_name}-${format("%02d",count.index+1)}"
    Environment = "${var.envname}"
    Stack       = "${var.app_stack}"
    Component   = "${var.app_name}"
    Service     = "${var.app_stack}_${var.app_name}"
  }
}
