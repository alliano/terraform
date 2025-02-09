variable "compute_default_zone" {
  type    = string
  default = "asia-southeast2-a"
}

variable "is_allow_stop_to_update_gce" {
  type    = bool
  default = true
}

variable "service_account" {
  default = "pekerja"
  type    = string
}

variable "avalilablelity_zone" {
  type = list(any)
  default = [
    "asia-southeast2-a",
    "asia-southeast2-b",
    "asia-southeast2-c",
  ]
}

variable "map_avalilable_zone" {
  type = map(string)
  default = {
    "zone-1" = "asia-southeast2-a",
    "zone-2" = "asia-southeast2-b",
    "zone-3" = "asia-southeast2-c",
  }
}