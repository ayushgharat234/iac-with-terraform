variable "project_id" {}
variable "region" {}
variable "network_name" {}
variable "cidr_block" {}
variable "zone" {
    default = "asia-south1-c"
}
variable "member_email" {
  description = "Email ID of the IAM user or service account"
}
