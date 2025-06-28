resource "google_billing_budget" "monthly_budget" {
  billing_account = var.billing_account_id

  display_name = "GCP Monthly Budget"
  amount {
    specified_amount {
      currency_code = "USD"
      units         = var.budget_amount
    }
  }

  threshold_rules {
    threshold_percent = 0.5
  }

  threshold_rules {
    threshold_percent = 0.9
  }

  all_updates_rule {
    pubsub_topic        = var.pubsub_topic
    schema_version      = "1.0"
  }
}