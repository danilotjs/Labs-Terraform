resource "google_compute_instance" "dbserver1" {
  name         = "dbserver1"
  machine_type = "e2-small"
  zone         = google_compute_disk.dados.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet1.self_link

    access_config {

    }
  }

  attached_disk {
    source = google_compute_disk.dados.self_link
  }

  allow_stopping_for_update = true
}