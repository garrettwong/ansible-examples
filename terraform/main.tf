provider "google" {
  credentials = "${file("sa-key.json")}"
  project     = "forseti-security-new"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "ans-control-node"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["ansible", "allow-ssh", "allow-http"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    startup-script-url = "${google_storage_bucket.ansible_bucket.url}/${google_storage_bucket_object.startup_script.name}"
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

resource "google_compute_instance" "ansible_child_1" {
  name         = "ans-child-1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["allow-ssh", "allow-http"]

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
  name         = "ans-child-2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["allow-ssh", "allow-http"]

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

resource "google_storage_bucket" "ansible_bucket" {
  name     = "gw-ansible-bucket"
  location = "US"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_compute_project_metadata" "default" {
  metadata {
    sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}

resource "google_storage_bucket_object" "startup_script" {
  name   = "install-ansible.sh"
  source = "install-ansible.sh"
  bucket = "${google_storage_bucket.ansible_bucket.name}"

  depends_on = ["null_resource.config_ansible_hosts_file"]
}

resource "null_resource" "config_ansible_hosts_file" {
  provisioner "local-exec" {
    command = "scripts/config_ansible_hosts_file.sh ${google_compute_instance.ansible_child_1.network_interface.0.access_config.0.nat_ip} ${google_compute_instance.ansible_child_2.network_interface.0.access_config.0.nat_ip}"
  }

  # provisioner "local-exec" {
  #   command = "scripts/config_ansible_hosts_file.sh"
  #   when    = "destroy"
  # }
}
