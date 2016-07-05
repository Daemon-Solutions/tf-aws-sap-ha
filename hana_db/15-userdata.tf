resource "template_file" "user_data" {
  count    = "${var.create_ha + 1}"
  template = "${file("${var.user_data_file_path}")}"

  lifecycle {
    create_before_destroy = true
  }

  vars {
    app_name       = "${var.app_name}"
    envname        = "${var.envname}"
    envtype        = "${var.envtype}"
    region         = "${var.aws_region}"
    domain         = "${var.domain}"
    sap_sid        = "${var.sap_sid}"
    project_prefix = "${var.project_prefix}"
    create_new_ebs = "${var.create_new_ebs}"
    svr_index      = "${format("%02d",count.index+1)}"
  }
}
