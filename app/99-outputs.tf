output "instance_ids" {
  value = "${join(",",aws_instance.app.*.id)}"
}
