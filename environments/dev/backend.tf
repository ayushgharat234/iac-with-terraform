terraform {
    backend "gcs" {
        bucket = "terrafrom-state-ayush"
        prefix = "env/dev"
    }
}