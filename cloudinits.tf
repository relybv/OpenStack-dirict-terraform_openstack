# Template for lb cloud-init bash
resource "template_file" "init_lb" {
    template = "${file("init_lb.tpl")}"
    vars {
        appl1_address = "${var.appl1_ip_address}"
        appl2_address = "${var.appl2_ip_address}"
        appl3_address = "${var.appl3_ip_address}"
        appl4_address = "${var.appl4_ip_address}"
        appl1_name = "${var.appl1_hostname}"
        appl2_name = "${var.appl2_hostname}"
        appl3_name = "${var.appl3_hostname}"
        appl4_name = "${var.appl4_hostname}"
        monitor_address = "${var.monitor1_ip_address}"
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
        monitor_address = "${var.monitor1_ip_address}"
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
