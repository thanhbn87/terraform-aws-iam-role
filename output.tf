output "iam_instance_profile" {
  description = "The iam instance profile"
  value       = "${element(concat(aws_iam_instance_profile.ec2.*.name,list("")),0)}"
}

output "name" {
  description = "The iam role name"
  value       = "${aws_iam_role.this.name}"
}

output "arn" {
  description = "The iam role arn"
  value       = "${aws_iam_role.this.arn}"
}

output "id" {
  description = "The iam role id"
  value       = "${aws_iam_role.this.id}"
}
