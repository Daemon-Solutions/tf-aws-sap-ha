resource "aws_route53_record" "dns" {
  count   = "${var.create_r53 * (var.create_ha + 1)}"
  zone_id = "${var.r53_zone}"
  name    = "${replace(var.app_name,"_","")}-${format("%02d",count.index+1)}.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${element(aws_instance.app.*.private_ip,count.index)}"]
}
