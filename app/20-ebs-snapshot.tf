resource "aws_ebs_volume" "usr_sap" {
  count             = "${var.use_ebs_snapshots * (var.create_ha + 1)}"
  size              = "${element(split(",",var.ebs_volume_sizes),0)}"
  snapshot_id       = "${element(split(",",var.ebs_snapshots),0)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-usr_sap"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdh"
  }
}

resource "aws_ebs_volume" "usr_sap_sid" {
  count             = "${var.use_ebs_snapshots * (var.create_ha + 1)}"
  size              = "${element(split(",",var.ebs_volume_sizes),1)}"
  snapshot_id       = "${element(split(",",var.ebs_snapshots),1)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-usr_sap_sid"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdi"
  }
}

resource "aws_ebs_volume" "usr_sap_trans" {
  count             = "${var.use_ebs_snapshots * (var.create_ha + 1)}"
  size              = "${element(split(",",var.ebs_volume_sizes),2)}"
  snapshot_id       = "${element(split(",",var.ebs_snapshots),2)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-usr_sap_trans"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdj"
  }
}

resource "aws_ebs_volume" "sapmnt" {
  count             = "${var.use_ebs_snapshots * (var.create_ha + 1)}"
  size              = "${element(split(",",var.ebs_volume_sizes),3)}"
  snapshot_id       = "${element(split(",",var.ebs_snapshots),3)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-sapmnt"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdk"
  }
}

resource "aws_ebs_volume" "media" {
  count             = "${var.use_ebs_snapshots * (var.create_ha + 1)}"
  size              = "${element(split(",",var.ebs_volume_sizes),4)}"
  snapshot_id       = "${element(split(",",var.ebs_snapshots),4)}"
  availability_zone = "${element(split(",",var.availability_zones),count.index)}"
  encrypted         = "${var.encrypt_ebs_volumes}"
  type              = "${var.ebs_volume_type}"
  tags {
    Name = "${var.project_prefix}-${var.envname}-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}-media"
    For  = "${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}:xvdl"
  }
}
