#
# Variables
#
variable "enabled" { 
  description = "Whether or not create the role"
  type        = bool
  default     = true 
}
variable "name" { 
  description = "Name of the role"
  type        = string
  default = "role"
}
variable "description" { 
  description = "Description name of the role"
  type        = string
  default     = "" 
}

variable "policy_arns" {
  description = "List of ARNs of IAM policies to attach to IAM role"
  type        = list(string)
  default     = []
}
variable "temp_file_assumerole" { 
  description = "The file path of template of Assume role"
  type        = string
  default     = "" 
}
variable "temp_file_policy" { 
  description = "The file path of template of inline Policy"
  type        = string
  default     = "" 
}
variable "identifiers" { 
  description = "The trusted identifiers"
  type        = list(string)
  default     = [
    "ec2.amazonaws.com"
  ]
}
variable "resources" {
  description = "The Resources of Inline policy"
  type        = list(string)
  default     = ["*"] 
}
variable "inline_policy" {
  description = "Whether or not create the inline policy"
  type        = bool
  default     = true 
}
variable "inline_policy_name" { 
  description = "Customized name of the inline policy"
  type        = string
  default     = "" 
}
variable "path" { 
  description = "Path of the role"
  type        = string
  default     = "/" 
}

variable tags {
  default = {}
}
