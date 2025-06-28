resource "google_project_iam_member" "iam_binding" {
    for_each = toset(var.roles)

    project = var.project_id
     role    = each.value

    member = var.member_type == "user" ? "user:${var.member_email}" : "serviceAccount:${var.member_email}"
}