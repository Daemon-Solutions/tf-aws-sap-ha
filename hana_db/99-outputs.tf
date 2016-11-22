# We only want the first instance attached to the ELB
output "hana_instance1" {
  value = "${aws_instance.instance_snap.0.id}"
}
