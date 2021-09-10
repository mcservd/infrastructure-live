resource "google_dns_managed_zone" "this" {
  dns_name = var.domain
  name = var.name
}

resource "google_service_account" "this" {
  account_id = format("%s-sa" , var.name)
}

data "google_iam_policy" "this" {
  binding {
    members = [
      format("serviceAccount:%s", google_service_account.this.email)
    ]
    role = "roles/dns.admin"
  }
}

resource "google_service_account_iam_binding" "this" {
  members = []
  role = ""
  service_account_id = ""
}
