output "lb_ip_address" {
  description = "Public IP address of the HTTP Load Balancer"
  value       = google_compute_global_forwarding_rule.test.ip_address
}
