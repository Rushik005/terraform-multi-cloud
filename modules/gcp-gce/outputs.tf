output "instance_id" {
  description = "ID of the GCE instance"
  value       = google_compute_instance.vm.id
}

output "instance_name" {
  description = "Name of the GCE instance"
  value       = google_compute_instance.vm.name
}

output "instance_self_link" {
  description = "Self link of the GCE instance"
  value       = google_compute_instance.vm.self_link
}

output "instance_internal_ip" {
  description = "Internal IP address of the instance"
  value       = google_compute_instance.vm.network_interface[0].network_ip
}

output "instance_external_ip" {
  description = "External IP address of the instance (if assigned)"
  value       = try(
    google_compute_instance.vm.network_interface[0].access_config[0].nat_ip,
    null
  )
}

output "instance_zone" {
  description = "Zone where the instance is deployed"
  value       = google_compute_instance.vm.zone
}
