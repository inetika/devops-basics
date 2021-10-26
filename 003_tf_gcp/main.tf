provider "google" {
  credentials = file("~/.gcp/dorian-tutorials.json")
  project     = "dorian-tutorials"
  region      = "us-west2"
}

resource "google_compute_instance" "main" {
  name         = "dorians-webserver"
  machine_type = "e2-micro"
  zone         = "us-west2-a"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  metadata_startup_script = "sudo yum -y install nginx; sudo systemctl start nginx"

  metadata = {
    ssh-keys = "umica:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  labels = {
    "service" = "web"
  }
  
  resource_policies = []
  tags = []
}

resource "google_compute_firewall" "default" {
  name    = "dorians-webserver-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = []
  target_tags = []
}

output "gcp-ip" {
  value = google_compute_instance.main.network_interface.0.access_config.0.nat_ip
}