output "network_name" {
    value = module.networking.network_name
}

output "instance_ip" {
  value = module.compute.instance_ip
}

output "bucket_url" {
  value = module.storage.bucket_url
}