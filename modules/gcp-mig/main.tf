resource "google_compute_instance_template" "template" {
  name_prefix = "${var.name}-tmpl-"
  project     = var.project_id
  machine_type = var.machine_type

  tags   = ["http-server"]
  labels = var.labels

  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    subnetwork = var.subnet_self_link
    access_config {}
  }

  metadata_startup_script = <<EOF
#!/bin/bash
echo "OK" > /var/www/html/health
nohup python3 -m http.server 80 &
EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_region_instance_group_manager" "mig" {
  name               = "${var.name}-mig"
  project            = var.project_id
  region             = var.region
  base_instance_name = var.name

  version {
    instance_template = google_compute_instance_template.template.id
  }

  target_size = var.min_replicas
}

resource "google_compute_autoscaler" "autoscaler" {
  name    = "${var.name}-autoscaler"
  project = var.project_id
  region  = var.region
  target  = google_compute_region_instance_group_manager.mig.id

  autoscaling_policy {
    min_replicas = var.min_replicas
    max_replicas = var.max_replicas

    cpu_utilization {
      target = 0.6
    }
  }
}
