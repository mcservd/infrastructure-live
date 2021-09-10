resource "google_dns_managed_zone" "this" {
  dns_name = var.domain
  name = var.name
}

resource "google_service_account" "this" {
  account_id = format("%s-sa" , var.name)
}

resource "google_project_iam_member" "this" {
  member = "serviceAccount:${google_service_account.this.email}"
  role = "roles/dns.admin"
}