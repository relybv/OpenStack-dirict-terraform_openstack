#
# Network definitions
#
resource "openstack_networking_network_v2" "frontend" {
  name = "frontend_${var.customer}_${var.environment}"
  region = "${var.region}"
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "backend" {
  name = "backend_${var.customer}_${var.environment}"
  region = "${var.region}"
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "jump" {
  name = "jump_${var.customer}_${var.environment}"
  region = "${var.region}"
  admin_state_up = "true"
}

#
# Subnet definitions
#
resource "openstack_networking_subnet_v2" "frontend" {
  name = "frontend_${var.customer}_${var.environment}"
  region = "${var.region}"
  network_id = "${openstack_networking_network_v2.frontend.id}"
  cidr = "172.16.10.0/24"
  ip_version = 4
  enable_dhcp = "true"
  dns_nameservers = ["8.8.8.8","8.8.4.4"]
}

resource "openstack_networking_subnet_v2" "backend" {
  name = "backend_${var.customer}_${var.environment}"
  region = "${var.region}"
  network_id = "${openstack_networking_network_v2.backend.id}"
  cidr = "172.16.20.0/24"
  ip_version = 4
  enable_dhcp = "true"
  dns_nameservers = ["8.8.8.8","8.8.4.4"]
}

resource "openstack_networking_subnet_v2" "jump" {
  name = "jump_${var.customer}_${var.environment}"
  region = "${var.region}"
  network_id = "${openstack_networking_network_v2.jump.id}"
  cidr = "172.16.30.0/24"
  ip_version = 4
  enable_dhcp = "true"
  dns_nameservers = ["8.8.8.8","8.8.4.4"]
}

#
# Router definitions
#
resource "openstack_networking_router_v2" "terraform" {
  name = "terraform_${var.customer}_${var.environment}"
  region = "${var.region}"
  admin_state_up = "true"
  external_gateway = "${var.external_gateway}"
}

#
# Router interface definitions
#
resource "openstack_networking_router_interface_v2" "frontend" {
  region = "${var.region}"
  router_id = "${openstack_networking_router_v2.terraform.id}"
  subnet_id = "${openstack_networking_subnet_v2.frontend.id}"
}

resource "openstack_networking_router_interface_v2" "backend" {
  region = "${var.region}"
  router_id = "${openstack_networking_router_v2.terraform.id}"
  subnet_id = "${openstack_networking_subnet_v2.backend.id}"
}

resource "openstack_networking_router_interface_v2" "jump" {
  region = "${var.region}"
  router_id = "${openstack_networking_router_v2.terraform.id}"
  subnet_id = "${openstack_networking_subnet_v2.jump.id}"
}
