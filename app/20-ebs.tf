resource "aws_ebs_volume" "new_usr_sap" {
  count             = "${lookup(var.new_ebs_map,var.use_ebs_snapshots) * (var.create_ha + 1)}"
  size              = "${element(split(",",var.ebs_volume_sizes),0)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-usr_sap"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdh"
  }
}

resource "aws_ebs_volume" "new_usr_sap_sid" {
  count             = "${lookup(var.new_ebs_map,var.use_ebs_snapshots) * (var.create_ha + 1)}"
  size              = "${element(split(",",var.ebs_volume_sizes),1)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-usr_sap_sid"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdi"
  }
}

resource "aws_ebs_volume" "new_usr_sap_trans" {
  count             = "${lookup(var.new_ebs_map,var.use_ebs_snapshots) * (var.create_ha + 1)}"
  size              = "${element(split(",",var.ebs_volume_sizes),2)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-usr_sap_trans"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdj"
  }
}

resource "aws_ebs_volume" "new_sapmnt" {
  count             = "${lookup(var.new_ebs_map,var.use_ebs_snapshots) * (var.create_ha + 1)}"
  size              = "${element(split(",",var.ebs_volume_sizes),3)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-sapmnt"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdk"
  }
}

resource "aws_ebs_volume" "new_media" {
  count             = "${lookup(var.new_ebs_map,var.use_ebs_snapshots) * (var.create_ha + 1)}"
  size              = "${element(split(",",var.ebs_volume_sizes),4)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-media"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdl"
  }
}
