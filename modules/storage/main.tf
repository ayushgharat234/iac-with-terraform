resource "google_storage_bucket" "bucket" {
    name = var.bucket_name
    location = "ASIA"
    force_destroy = true
}