output "id" {
  description = "OCID of the service gateway."
  value       = oci_core_service_gateway.this.id
}

output "display_name" {
  description = "Display name of the service gateway."
  value       = oci_core_service_gateway.this.display_name
}

output "services" {
  description = "Services enabled on the service gateway."
  value       = oci_core_service_gateway.this.services
}

output "state" {
  description = "Lifecycle state of the service gateway."
  value       = oci_core_service_gateway.this.state
}
