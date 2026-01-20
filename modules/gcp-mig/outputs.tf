output "instance_group" {
  description = "Instance group self link"
  value       = google_compute_region_instance_group_manager.mig.instance_group
}
=
