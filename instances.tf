resource "openstack_compute_servergroup_v2" "appl" {
  name = "appl"
  policies = ["anti-affinity"]
}

resource "openstack_compute_instance_v2" "lb1" {
  name = "lb1"
  region = "${var.region}"
  image_name = "${var.image_ub}"
  flavor_name = "${var.flavor_lb}"
  key_pair = "${openstack_compute_keypair_v2.terraform.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.terraform.name}" ]
  floating_ip = "${openstack_compute_floatingip_v2.lb.address}"
  user_data = "${template_file.init_lb.rendered}"
  network {
    uuid = "${openstack_networking_network_v2.frontend.id}"
    fixed_ip_v4 = "172.16.10.51"
  }
}

resource "openstack_compute_instance_v2" "appl1" {
  name = "appl1"
  region = "${var.region}"
  image_name = "${var.image_deb}"
  flavor_name = "${var.flavor_appl}"
  key_pair = "${openstack_compute_keypair_v2.terraform.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.terraform.name}" ]
  user_data = "${template_file.init_appl.rendered}"
  network {
    uuid = "${openstack_networking_network_v2.frontend.id}"
    fixed_ip_v4 = "172.16.10.101"
  }
}

resource "openstack_compute_instance_v2" "appl2" {
  name = "appl2"
  region = "${var.region}"
  image_name = "${var.image_deb}"
  flavor_name = "${var.flavor_appl}"
  key_pair = "${openstack_compute_keypair_v2.terraform.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.terraform.name}" ]
  user_data = "${template_file.init_appl.rendered}"
  network {
    uuid = "${openstack_networking_network_v2.frontend.id}"
    fixed_ip_v4 = "172.16.10.102"
  }
}

resource "openstack_compute_instance_v2" "db1" {
  name = "db1"
  region = "${var.region}"
  image_name = "${var.image_deb}"
  flavor_name = "${var.flavor_db}"
  key_pair = "${openstack_compute_keypair_v2.terraform.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.terraform.name}" ]
  user_data = "${template_file.init_db.rendered}"
  network {
    uuid = "${openstack_networking_network_v2.backend.id}"
    fixed_ip_v4 = "172.16.20.101"
  }
  volume {
    volume_id = "${openstack_blockstorage_volume_v1.db.id}"
    device = "/dev/vdb"
  }
  volume {
    volume_id = "${openstack_blockstorage_volume_v1.nfs.id}"
    device = "/dev/vdc"
  }
}

resource "openstack_compute_instance_v2" "monitor1" {
  name = "monitor1"
  region = "${var.region}"
  image_name = "${var.image_ub}"
  flavor_name = "${var.flavor_mon}"
  key_pair = "${openstack_compute_keypair_v2.terraform.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.terraform.name}" ]
  user_data = "${template_file.init_monitor.rendered}"
  network {
    uuid = "${openstack_networking_network_v2.frontend.id}"
    fixed_ip_v4 = "172.16.10.201"
  }
  volume {
    volume_id = "${openstack_blockstorage_volume_v1.es.id}"
    device = "/dev/vdb"
  }
}

resource "openstack_compute_instance_v2" "jump" {
  name = "jumphost"
  region = "${var.region}"
  image_name = "${var.image_ub}"
  flavor_name = "${var.flavor_jump}"
  key_pair = "${openstack_compute_keypair_v2.terraform.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.terraform.name}" ]
  floating_ip = "${openstack_compute_floatingip_v2.jump.address}"
  user_data = "${template_file.init_jump.rendered}"
  network {
    uuid = "${openstack_networking_network_v2.jump.id}"
    fixed_ip_v4 = "172.16.30.20"
  }
}
