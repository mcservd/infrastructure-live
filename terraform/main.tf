module "kubernetes-cluster" {
  source = "./modules/google/kubernetes-cluster"
}

// TODO: Errors use gcloud login
//module "identity-provider" {
//  source = "./modules/google/identity-provider"
//}

module "dns-zone-public" {
  source = "./modules/google/dns-zone"

  name = "dns-zone-public"
  domain = "willpxxr.com."
}
