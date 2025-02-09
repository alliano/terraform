terraform {
  required_providers {
    google = {
      version = "6.14.1"
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  region = var.avalilablelity_zone[2]
  # nama prodjet kita yang berada pada gcp
  project = "microservices-infrastructure"
}

data "google_compute_image" "default_image" {
  project = "debian-cloud"
  family  = "debian-11"
}

resource "google_service_account" "service_account" {
  account_id   = var.service_account
  display_name = var.service_account
}

resource "google_compute_instance" "instance-1" {
  name         = "instance-1"
  machine_type = "e2-medium"
  labels = {
    "server" = "development"
  }

  allow_stopping_for_update = var.is_allow_stop_to_update_gce
  zone                      = var.map_avalilable_zone["zone-2"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.default_image.self_link
    }
  }

  network_interface {
    network = "default"

    access_config {
      
    }
  }
}