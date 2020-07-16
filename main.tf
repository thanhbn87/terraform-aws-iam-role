locals {
  temp_file_assumerole = var.temp_file_assumerole == "" ? "${path.module}/AssumeRoleService.json.tpl" : var.temp_file_assumerole 
  temp_file_policy     = var.temp_file_policy == "" ? "${path.module}/Policy.json.tpl" : var.temp_file_policy 
}

data "template_file" "assume_role" {
  count    = var.enabled ? 1 : 0
  template = file(local.temp_file_assumerole)
  vars {
    identifiers = jsonencode(var.identifiers)
  }
}

data "template_file" "inline" {
  count    = var.inline_policy && var.enabled ? 1 : 0
  template = file(local.temp_file_policy)
  vars {
    resources = jsonencode(var.resources)
  }
}

resource "aws_iam_role" "this" {
  count = var.enabled ? 1 : 0
  name  = local.name
  path  = var.path
  tags  = var.tags
  description        = var.description
  assume_role_policy = data.template_file.assume_role.rendered
}

resource "aws_iam_role_policy_attachment" "arn" {
  count      = var.enabled ? length(var.policy_arns) : 0
  role       = aws_iam_role.this[0].name
  policy_arn = element(var.policy_arns,count.index)
}

resource "aws_iam_role_policy" "inline" {
  count  = var.inline_policy && var.enabled ? 1 : 0
  name   = var.inline_policy_name == "" ? local.name : var.inline_policy_name
  role   = aws_iam_role.this.id
  policy = data.template_file.inline.rendered
}

resource "aws_iam_instance_profile" "ec2" {
  count = contains(var.identifiers, "ec2.amazonaws.com") && var.enabled ? 1 : 0
  name  = var.name
  role  = aws_iam_role.this[0].name
}