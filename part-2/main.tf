# ==========================CONFIG===============================
terraform {
  required_providers {
    google = {
      version = "6.14.1"
      source  = "hashicorp/google"
    }
  }
}
provider "google" {
  region  = "asia-southeast2"
  project = "mincroservices-dev"
}

# datasource
data "google_compute_image" "debian_dev" {
  project = "debian-cloud"
  family  = "debian-11"
}
#=======================END CONFIG==============================

resource "google_service_account" "service_account" {
  account_id   = "pekerja"
  display_name = "pekerja"
}

# digunakan untuk membuat resoruce atau menggunakan layanan yang disediakan oleh cloud provier misalnya, pada gcp:
# compoute engine
# membuat virtual machine
# bucket storage
# database atau jaringan
# dsb
resource "google_compute_instance" "product-service" {
  name         = "product-service"
  machine_type = "e2-medium"
  zone         = "asia-southeast2-a"
  allow_stopping_for_update = true

  # memilih os yang ingin kita gunakan
  boot_disk {
    initialize_params {
      # menggunakan datasoruce
      image = data.google_compute_image.debian_dev.self_link
    }
  }

  network_interface {
    network = "default"

    access_config {

    }
  }
  
  service_account {
    email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }
}