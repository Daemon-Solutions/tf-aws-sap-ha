resource "aws_route53_record" "dns" {
  count   = "${lookup(var.logic_invert_map,var.use_ebs_snapshots) * var.create_r53 * (var.create_ha + 1)}"
  zone_id = "${var.r53_zone}"
  name    = "${replace(var.app_stack,"_","")}${replace(var.app_name,"_","")}-${format("%02d",count.index+1)}.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${element(aws_instance.instance.*.private_ip,count.index)}"]
}

resource "aws_route53_record" "dns_snap" {
  count   = "${var.use_ebs_snapshots * var.create_r53 * (var.create_ha + 1)}"
  zone_id = "${var.r53_zone}"
  name    = "${replace(var.app_stack,"_","")}${replace(var.app_name,"_","")}-${format("%02d",count.index+1)}.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${element(aws_instance.instance_snap.*.private_ip,count.index)}"]
}
