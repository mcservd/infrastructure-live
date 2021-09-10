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
    machine_type = "e2-standard-4"
    disk_size_gb = var.node_pool_disk_size
    // TODO: Hackuiri Daiquiri - No obvious way to perform mappings using TF yet...
    disk_type = var.node_pool_disk_type == "HHD" ? "pd-standard" : var.node_pool_disk_type == "SSD" ? "pd-ssd" : null
  }

  depends_on = [
    google_container_cluster.this
  ]
}
