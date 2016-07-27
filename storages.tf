resource "openstack_blockstorage_volume_v1" "db" {
  name = "db-volume_${var.customer}_${var.environment}"
  region = "${var.region}"
  description = "database volume Customer ${var.customer} Environment ${var.environment}"
  size = "${var.db_vol_gb}"
}

resource "openstack_blockstorage_volume_v1" "nfs" {
  name = "nfs-volume_${var.customer}_${var.environment}"
  region = "${var.region}"
  description = "nfs volume Customer ${var.customer} Environment ${var.environment}"
  size = "${var.nfs_vol_gb}"
}

resource "openstack_blockstorage_volume_v1" "es" {
  name = "es-volume_${var.customer}_${var.environment}"
  region = "${var.region}"
  description = "elasticsearch volume Customer ${var.customer} Environment ${var.environment}"
  size = "${var.es_vol_gb}"
}
