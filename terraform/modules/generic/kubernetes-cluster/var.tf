variable "name" {
  type = string
  default = "kubernetes-cluster"
  description = "Name of the Kubernetes Cluster"
}

variable "node_pool_size" {
  type = number
  default = 1
  description = "The size of the Node Pool backing the Cluster"
}

variable "node_pool_disk_size" {
  type = number
  default = 30
  description = "The size of the disk attached to each Node Pool for storage"
}

variable "node_pool_disk_type" {
  type = string
  default = "HHD"
  description = "The type of the disk attached to each Node Pool for storage"

  validation {
    condition = contains(["HHD", "SSD"], var.node_pool_disk_type)
    error_message = "Allowed values for input_parameter are \"HHD\" or \"SSD\"."
  }
}