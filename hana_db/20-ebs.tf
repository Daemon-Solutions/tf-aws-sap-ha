resource "aws_ebs_volume" "db_backups" {
  count             = "${var.create_ha + 1}"
  size              = "${var.ebs_db_backups}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "standard"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${var.app_name}-${format("%02d",count.index+1)}-db-backups"
    For  = "${var.app_name}-${format("%02d",count.index+1)}:xvdc"
  }
}

resource "aws_ebs_volume" "stripe1" {
  count             = "${var.create_ha + 1}"
  size              = "${lookup(var.ebs_stripe_size,var.instance_type)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "gp2"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${var.app_name}-${format("%02d",count.index+1)}-stripe1"
    For  = "${var.app_name}-${format("%02d",count.index+1)}:xvdd"
  }
}

resource "aws_ebs_volume" "stripe2" {
  count             = "${var.create_ha + 1}"
  size              = "${lookup(var.ebs_stripe_size,var.instance_type)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "gp2"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${var.app_name}-${format("%02d",count.index+1)}-stripe2"
    For  = "${var.app_name}-${format("%02d",count.index+1)}:xvde"
  }
}

resource "aws_ebs_volume" "stripe3" {
  count             = "${var.create_ha + 1}"
  size              = "${lookup(var.ebs_stripe_size,var.instance_type)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "gp2"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${var.app_name}-${format("%02d",count.index+1)}-stripe3"
    For  = "${var.app_name}-${format("%02d",count.index+1)}:xvdf"
  }
}

resource "aws_ebs_volume" "stripe4" {
  count             = "${var.create_ha + 1}"
  size              = "${lookup(var.ebs_stripe_size,var.instance_type)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "gp2"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${var.app_name}-${format("%02d",count.index+1)}-stripe4"
    For  = "${var.app_name}-${format("%02d",count.index+1)}:xvdg"
  }
}

resource "aws_ebs_volume" "usr_sap" {
  count             = "${var.create_ha + 1}"
  size              = "${var.ebs_usr_sap}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "gp2"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${var.app_name}-${format("%02d",count.index+1)}-usr-sap"
    For  = "${var.app_name}-${format("%02d",count.index+1)}:xvdh"
  }
}

resource "aws_ebs_volume" "media" {
  count             = "${var.create_ha + 1}"
  size              = "${var.ebs_media}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "gp2"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${var.app_name}-${format("%02d",count.index+1)}-media"
    For  = "${var.app_name}-${format("%02d",count.index+1)}:xvdi"
  }
}
