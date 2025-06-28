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
variable "billing_account_id" {}
variable "pubsub_topic" {}
variable "notification_channel_id" {}
