resource "google_project_iam_member" "viewer" {
  project = var.project_id
  role = "roles/viewer"
  member = "serviceAccount:${var.project_id}@appspot.gserviceaccount.com"
}