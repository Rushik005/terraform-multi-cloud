resource "google_compute_health_check" "http" {
  name    = "${var.name}-hc"
  project = var.project_id

  http_health_check {
    port = 80
    request_path = "/health"
  }
}

resource "google_compute_backend_service" "test" {
  name          = "${var.name}-backend"
  project       = var.project_id
  protocol      = "HTTP"
  health_checks = [google_compute_health_check.test.id]

  backend {
    group = var.backend_service_id
  }
}

resource "google_compute_url_map" "test" {
  name            = "${var.name}-url-map"
  project         = var.project_id
  default_service = google_compute_backend_service.test.id
}

resource "google_compute_target_http_proxy" "test" {
  name    = "${var.name}-http-proxy"
  project = var.project_id
  url_map = google_compute_url_map.test.id
}

resource "google_compute_global_forwarding_rule" "test" {
  name       = "${var.name}-fw-rule"
  project    = var.project_id
  target     = google_compute_target_http_proxy.test.id
  port_range = "80"
}
