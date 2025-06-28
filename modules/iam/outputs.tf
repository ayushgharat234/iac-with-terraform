output "iam_binding" {
    value = google_project_iam_member.viewer.role
}