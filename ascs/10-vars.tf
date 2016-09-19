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
variable "create_ha"         { default = 0 }
variable "create_r53"        { default = 1 }
variable "use_ebs_snapshots" { default = 0 }

# == Maps
variable "logic_invert_map" {
  type    = "map"
  default = {
    "0" = "1"
    "1" = "0"
  }
}

# == Generic EBS Options
variable "encrypt_ebs_volumes" { default = false }
variable "ebs_optimised"       { default = true  }

# == Volume Sizes
variable "root_volume_size"     {}
variable "ebs_swap_size"        {}
variable "ebs_usr_sap_size"     {}
variable "ebs_usr_sap_sid_size" {}
variable "ebs_snapshots"        { default = "" }

# == EC2 instance
variable "key_name"                    {}
variable "instance_subnets"            {}
variable "iam_instance_profile"        {}
variable "security_groups"             {}
variable "ami_id"                      {}
variable "instance_type"               {}
variable "termination_protection"      { default = false }
variable "associate_public_ip_address" { default = false }
variable "user_data_file_path"         { default = "../localmodules//tf-aws-sap-ha/include/userdata_ascs.tmpl" }
