resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.tf-vpc-lab.self_link
  disabled = false
  allow {
  protocol = "tcp"
  ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-default-ports" {
  name    = "allow-default-ports"
  network = google_compute_network.tf-vpc-lab.self_link

  allow {
  protocol = "icmp"
  }

  allow {
  protocol = "tcp"
  ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}
