# Template for lb cloud-init bash
resource "template_file" "init_lb" {
    template = "${file("init_lb.tpl")}"
    vars {
        appl1_address = "${openstack_compute_instance_v2.appl1.network.0.fixed_ip_v4}"
        appl2_address = "${openstack_compute_instance_v2.appl2.network.0.fixed_ip_v4}"
        appl1_name = "${openstack_compute_instance_v2.appl1.name}"
        appl2_name = "${openstack_compute_instance_v2.appl2.name}"
        monitor_address = "${openstack_compute_instance_v2.monitor1.network.0.fixed_ip_v4}"
    }
}

# Template for appl cloud-init bash
resource "template_file" "init_appl" {
    template = "${file("init_appl.tpl")}"
    vars {
        monitor_address = "${openstack_compute_instance_v2.monitor1.network.0.fixed_ip_v4}"
        nfs_address = "${openstack_compute_instance_v2.db1.network.0.fixed_ip_v4}"
        db_address = "${openstack_compute_instance_v2.db1.network.0.fixed_ip_v4}"
        ext_lb_fqdn = "${concat(var.ext_lb_name,".",var.environment,".",var.customer,".",var.domain_base)}"
    }
}

# Template for db cloud-init bash
resource "template_file" "init_db" {
    template = "${file("init_db.tpl")}"
    vars {
        monitor_address = "${openstack_compute_instance_v2.monitor1.network.0.fixed_ip_v4}"
    }
}

# Template for monitor cloud-init bash
resource "template_file" "init_monitor" {
    template = "${file("init_monitor.tpl")}"
}

# Template for jump cloud-init bash
resource "template_file" "init_jump" {
    template = "${file("init_jump.tpl")}"
    vars {
    }
}

# Template for win cloud-init powershell
resource "template_file" "init_win" {
    template = "${file("init_win.tpl")}"
    vars {
        monitor_address = "${openstack_compute_instance_v2.monitor1.network.0.fixed_ip_v4}"
    }
}
