variable "instance_count" {
  default = 1
}

variable "name_prefix" {
  default = "iac"
}

variable "machine_type" {
  default = "e2-micro"
}

variable "zone" {}

variable "boot_image" {
  default = "debian-cloud/debian-12"
}

variable "subnet_self_link" {}

variable "startup_script" {
  default = ""
}

variable "tags" {
  default = []
}
