output "iam_instance_profile" {
  description = "The iam instance profile"
  value       = "${element(concat(aws_iam_instance_profile.ec2.*.name,list("")),0)}"
}

output "name" {
  description = "The iam role name"
  value       = "${element(concat(aws_iam_role.this.*.name,list("")),0)}"
}

output "arn" {
  description = "The iam role arn"
  value       = "${element(concat(aws_iam_role.this.*.arn,list("")),0)}"
}

output "id" {
  description = "The iam role id"
  value       = "${element(concat(aws_iam_role.this.*.id,list("")),0)}"
}
