resource "google_container_cluster" "this" {
  name = var.name

  remove_default_node_pool = true
  initial_node_count = 1
}

resource "google_container_node_pool" "this" {
  cluster = google_container_cluster.this.name

  name = format("%s-node-pool", var.name)
  node_count = var.node_pool_size

  node_config {
    preemptible = true
    machine_type = "e2-medium"
    disk_size_gb = var.node_pool_disk_size
    // TODO: Hackuiri Daiquiri - No obvious way to perform mappings using TF yet...
    disk_type = var.node_pool_disk_type == "HHD" ? "pd-standard" : var.node_pool_disk_type == "SSD" ? "pd-ssd" : null
  }

  depends_on = [
    google_container_cluster.this
  ]
}

resource "google_container_node_pool" "this_ingress_node_pool" {
  cluster = google_container_cluster.this.name

  name = format("%s-ingress-node-pool", var.name)
  node_count = 1

  node_config {
    preemptible = true
    machine_type = "e2-micro"
    disk_size_gb = 10
    disk_type = "pd-standard"

    taint {
      effect = "NO_SCHEDULE"
      key = "dedicated"
      value = "ingress"
    }
  }

  depends_on = [
    google_container_cluster.this
  ]
}
