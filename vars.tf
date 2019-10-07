#
# Variables
#
variable "enabled" { default = true }
variable "namespace" { default = "" }
variable "name" { default = "role" }
variable "customized_nam" { default = "" }
variable "project_env" { default = "Production" }
variable "project_env_short" { default = "prd" }

variable "temp_file_assumerole" { default = "" }
variable "temp_file_policy" { default = "" }
variable "identifiers" { default = ["ec2.amazonaws.com"] }
variable "resources" { default = ["*"] }
variable "aws_policies" { default = [] }
variable "service_roles" { default = [] }
variable "aws_service_roles" { default = [] }
variable "inline_policy" { default = true }
variable "inline_policy_name" { default = "" }

variable tags {
  default = {}
}
