resource "google_monitoring_alert_policy" "cpu_alert" {
    display_name = "High CPU Alert"
    combiner = "OR"

    conditions {
        display_name = "VM Instance CPU > 80% for 1m"
        condition_threshold {
          filter = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
          duration = "60s"
          comparison = "GT"
          threshold_value = 0.8

          aggregations {
            alignment_period = "60s"
            per_series_aligner = "ALIGN_MEAN"
            cross_series_reducer = "REDUCE_MEAN"
            group_by_fields = ["resource.label.instance_id"]
          }
        }
    }

    notification_channels = [var.notification_channel_id]
    enabled = true
}