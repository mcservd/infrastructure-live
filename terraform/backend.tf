terraform {
  backend "gcs" {
    bucket = "willpxxr-tf-state"
    prefix  = "terraform/state"
  }
}
