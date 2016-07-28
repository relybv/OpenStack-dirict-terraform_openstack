# specify customer and environment
variable "customer" {
    default = "dirict"
}

variable "environment" {
    default = "acc"
}

# specify external domain base
variable "domain_base" {
    default = "openstack.rely.nl"
}

# specify A record name for external load balancer
variable "ext_lb_name" {
    default = "acc"
}

# specify AWS credentials as 'export TF_VAR_aws_access_key=<accesskey>; export TF_VAR_aws_secret_key=<secretkey>'
variable "aws_access_key" {}
variable "aws_secret_key" {}

# specify stack user
variable "user_name" {}

# set password as 'export TF_VAR_password=<password>'
variable "password" {}

# generate your own key
variable "ssh_key_file" {
    default = "~/.ssh/id_rsa.terraform"
}

# Variables for terraform remote state
variable "swift_bucket_name" {
    default = "terraform-state-backend"
}
variable "swift_key" {
    default = "/terraform.tfstate"
}
variable "swift_region" {
    default = "eu-central-1"
}

############### Storage device definitions ###############
variable "db_storage" {
    default = "/dev/vdb"
}
variable "nfs_storage" {
    default = "/dev/vdc"
}
variable "monitor_storage" {
    default = "/dev/vdb"
}

############### Hostnames ###############
variable "appl1_hostname" {
    default = "appl1"
}
variable "appl2_hostname" {
    default = "appl2"
}
variable "appl3_hostname" {
    default = "appl3"
}
variable "appl4_hostname" {
    default = "appl4"
}
variable "lb1_hostname" {
    default = "lb1"
}
variable "db1_hostname" {
    default = "db1"
}
############### Fixed IP addresses ###############

variable "jump_ip_address" {
    default = "172.16.30.20"
}
variable "monitor1_ip_address" {
    default = "172.16.10.201"
}
variable "lb1_ip_address" {
    default = "172.16.10.51"
}
variable "db1_ip_address" {
    default = "172.16.20.101"
}
variable "db2_ip_address" {
    default = "172.16.20.102"
}
variable "appl1_ip_address" {
    default = "172.16.10.101"
}
variable "appl2_ip_address" {
    default = "172.16.10.102"
}
variable "appl3_ip_address" {
    default = "172.16.10.103"
}
variable "appl4_ip_address" {
    default = "172.16.10.104"
}
variable "win1_ip_address" {
    default = "172.16.20.50"
}

############### adjust as needed ###############
variable "db_vol_gb" {
    default = 10
}

variable "nfs_vol_gb" {
    default = 10
}

variable "es_vol_gb" {
    default = 10
}


############### leave unchanged for naturalis openstack ###################
variable "tenant_name" {
    default = "dirict-acc"
}

variable "auth_url" {
    default = "https://access.openstack.rely.nl:5000/v2.0"
}

variable "region" {
    default = "RegionOne"
}

variable "external_gateway" {
    default = "2613fe91-7fa1-4033-8fd3-678e7e9e15e7"
}

variable "pool" {
    default = "external"
}

variable "image_deb" {
    default = "debian-7-amd64"
}

variable "image_ub" {
    default = "Ubuntu 14.04 LTS"
}

variable "image_win" {
    default = "Windows Server 2012 R2 Std Eval"
}

variable "flavor_appl" {
    default = "ha_localdisk.1c.1r.20h"
}

variable "flavor_db" {
    default = "ha_localdisk.1c.1r.20h"
}

variable "flavor_mon" {
    default = "ha_localdisk.2c.4r.60h"
}

variable "flavor_win" {
    default = "ha_localdisk.2c.4r.60h"
}

variable "flavor_lb" {
    default = "ha_localdisk.1c.1r.20h"
}

variable "flavor_jump" {
    default = "ha_localdisk.1c.1r.20h"
}
