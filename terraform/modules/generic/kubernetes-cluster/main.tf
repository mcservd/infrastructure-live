module "this" {
  source = "../../gcloud/kubernetes-cluster"

  name = var.name
  node_pool_size = var.node_pool_size
  node_pool_disk_size = var.node_pool_disk_size
  node_pool_disk_type = var.node_pool_disk_type
}