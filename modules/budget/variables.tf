variable "billing_account_id" {}
variable "budget_amount" {
  description = "Monthly budget amount in USD"
  default     = 30
}
variable "pubsub_topic" {
  description = "Pub/Sub topic for budget alerts"
}
