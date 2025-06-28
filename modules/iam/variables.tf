variable "project_id" {}

variable "member_email" {
  description = "Email of the member (user or service account)"
}

variable "roles" {
  type        = list(string)
  description = "List of roles to assign"
}

variable "member_type" {
  default     = "user"
  description = "Type of IAM member: user or serviceAccount"
}