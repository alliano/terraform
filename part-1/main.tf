terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.14.1"
    }
  }
}
# ============================CONFIG=============================

# datasource
data "google_compute_image" "my_image" {
  family  = "debian-11"
  project = "debian-cloud"
}


provider "google" {
  project = "terraform"
  region  = "asia-southeast2"
}

# end config =======================================================


resource "google_compute_instance" "my_instance" {
  name         = "instance-2"
  machine_type = "e2-medium"
  zone         = "asia-southeast2"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }
  network_interface {
    network = "default"

    access_config {

    }
  }
  service_account {
    scopes = ["cloud-platform"]
  }
}


resource "google_compute_instance" "instance-1" {
  name         = "instance-1"
  machine_type = "e2-medium"
  zone         = "asia-southeast2"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {

    }
  }

  service_account {
    scopes = ["cloud-platform"]
  }

}