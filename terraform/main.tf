provider "google" {
  credentials = "${file("sa-key.json")}"
  project     = "cltestproject-219903"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "ansible-host"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["ansible"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_instance" "ansible_child_1" {
  name         = "ansible-child-1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

}

resource "google_compute_instance" "ansible_child_2" {
  name         = "ansible-child-2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

}

resource "google_storage_bucket" "image-store" {
  name     = "gw-ansible-bucket"
  location = "US"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
