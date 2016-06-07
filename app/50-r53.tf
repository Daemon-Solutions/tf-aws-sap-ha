resource "aws_route53_record" "dns" {
  count   = "${var.create_ha + 1}"
  zone_id = "${var.r53_zone}"
  name    = "${replace(element(split(",",var.app_names),0),"_","")}${format("%02d",count.index+1)}.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${element(aws_instance.app.*.private_ip,count.index)}"]
}

resource "aws_route53_record" "pub_dns" {
  count   = "${var.create_public_dns}"
  zone_id = "${var.r53_zone}"
  name    = "${replace(element(split(",",var.app_names),1),"_","")}.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.app.public_ip}"]
}
