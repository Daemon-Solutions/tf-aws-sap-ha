# == Naming + Placement
variable "envtype"            {}
variable "envname"            {}
variable "app_name"           {}
variable "app_stack"          {}
variable "domain"             {}
variable "aws_region"         {}
variable "project_prefix"     {}
variable "sap_sid"            {}
variable "availability_zones" {}
variable "r53_zone"           {}

# == Conditionals
variable "create_ha"      { default = 0 }
variable "create_r53"     { default = 1 }

# == Generic EBS Options
variable "encrypt_ebs_volumes" { default = false }
variable "ebs_optimised"       { default = true }

# == Volume Sizes
variable "root_volume_size"     { default = "20" }
variable "ebs_swap_size"        { default = "4" }
variable "ebs_usr_sap_size"     { default = "50"  }
variable "ebs_usr_sap_sid_size" { default = "40"  }

# == EC2 instance
variable "key_name"                    {}
variable "instance_subnets"            {}
variable "iam_instance_profile"        {}
variable "security_groups"             {}
variable "ami_id"                      {}
variable "instance_type"               {}
variable "termination_protection"      { default = false }
variable "associate_public_ip_address" { default = false }
variable "user_data_file_path"         { default = "../localmodules//tf-aws-sap-ha/include/app_userdata.tmpl" }
