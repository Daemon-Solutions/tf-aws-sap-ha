# == Naming + Placement
variable "envtype"            {}
variable "envname"            {}
variable "app_names"          {}
variable "domain"             {}
variable "aws_region"         {}
variable "project_prefix"     {}
variable "sap_sid"            {}
variable "availability_zones" {}
variable "r53_zone"           {}

# == Conditionals
variable "create_public_dns" { default = 0 }
variable "create_ha"         { default = 0 }
variable "use_new_ebs"       { default = 1 }

# == Maps
variable "swap_sizes" {
  type    = "map"
  default = {
    t2.medium  = "8"
    m4.large   = "16"
    m4.xlarge  = "32"
    m4.2xlarge = "64"
  }
}

# == EBS Options
variable "ebs_volume_sizes"     { default = ""    }
variable "ebs_snapshots"        { default = ""    }
variable "extra_ebs"            { default = ""    }
variable "encrypt_ebs_volumes"  { default = false }
variable "ebs_optimised"        { default = true  }
variable "ebs_volume_type"      { default = "gp2" }

# == EC2 instance
variable "key_name"                    {}
variable "instance_subnets"            {}
variable "iam_instance_profile"        {}
variable "security_groups"             {}
variable "ami_id"                      {}
variable "instance_type"               {}
variable "root_volume_size"            { default = "15" }
variable "termination_protection"      { default = false }
variable "associate_public_ip_address" { default = false }
variable "user_data_file_path"         { default = "../localmodules//tf-aws-sap-ha/include/app_userdata.tmpl" }
