resource "aws_ebs_volume" "usr_sap" {
  count             = "${var.create_ha + 1}"
  size              = "${var.ebs_usr_sap}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-usr_sap"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdh"
  }
}

resource "aws_ebs_volume" "usr_sap_sid" {
  count             = "${var.create_ha + 1}"
  size              = "${var.ebs_usr_sap_sid}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-usr_sap_sid"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdi"
  }
}

resource "aws_ebs_volume" "usr_sap_trans" {
  count             = "${var.create_ha + 1}"
  size              = "${var.ebs_usr_sap_trans}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-usr_sap_trans"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdj"
  }
}

resource "aws_ebs_volume" "sapmnt" {
  count             = "${var.create_ha + 1}"
  size              = "${var.ebs_sapmnt}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-sapmnt"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdk"
  }
}

resource "aws_ebs_volume" "media" {
  count             = "${var.create_ha + 1}"
  size              = "${var.ebs_media}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-media"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdl"
  }
}

resource "aws_ebs_volume" "swap" {
  count             = "${var.create_ha + 1}"
  size = "${lookup(var.swap_sizes,var.instance_type)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "gp2"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-swap"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:swap"
  }
}
