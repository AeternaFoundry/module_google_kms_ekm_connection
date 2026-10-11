output "kms_ekm_connections_id" {
  description = "Map of id values across all kms_ekm_connections, keyed the same as var.kms_ekm_connections except keys with no id are omitted"
  value       = { for k, v in google_kms_ekm_connection.kms_ekm_connections : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kms_ekm_connections_create_time" {
  description = "Map of create_time values across all kms_ekm_connections, keyed the same as var.kms_ekm_connections except keys with no create_time are omitted"
  value       = { for k, v in google_kms_ekm_connection.kms_ekm_connections : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "kms_ekm_connections_crypto_space_path" {
  description = "Map of crypto_space_path values across all kms_ekm_connections, keyed the same as var.kms_ekm_connections except keys with no crypto_space_path are omitted"
  value       = { for k, v in google_kms_ekm_connection.kms_ekm_connections : k => v.crypto_space_path if v.crypto_space_path != null && length(v.crypto_space_path) > 0 }
}
output "kms_ekm_connections_etag" {
  description = "Map of etag values across all kms_ekm_connections, keyed the same as var.kms_ekm_connections except keys with no etag are omitted"
  value       = { for k, v in google_kms_ekm_connection.kms_ekm_connections : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "kms_ekm_connections_key_management_mode" {
  description = "Map of key_management_mode values across all kms_ekm_connections, keyed the same as var.kms_ekm_connections except keys with no key_management_mode are omitted"
  value       = { for k, v in google_kms_ekm_connection.kms_ekm_connections : k => v.key_management_mode if v.key_management_mode != null && length(v.key_management_mode) > 0 }
}
output "kms_ekm_connections_location" {
  description = "Map of location values across all kms_ekm_connections, keyed the same as var.kms_ekm_connections except keys with no location are omitted"
  value       = { for k, v in google_kms_ekm_connection.kms_ekm_connections : k => v.location if v.location != null && length(v.location) > 0 }
}
output "kms_ekm_connections_name" {
  description = "Map of name values across all kms_ekm_connections, keyed the same as var.kms_ekm_connections except keys with no name are omitted"
  value       = { for k, v in google_kms_ekm_connection.kms_ekm_connections : k => v.name if v.name != null && length(v.name) > 0 }
}
output "kms_ekm_connections_project" {
  description = "Map of project values across all kms_ekm_connections, keyed the same as var.kms_ekm_connections except keys with no project are omitted"
  value       = { for k, v in google_kms_ekm_connection.kms_ekm_connections : k => v.project if v.project != null && length(v.project) > 0 }
}
output "kms_ekm_connections_service_resolvers" {
  description = "Map of service_resolvers values across all kms_ekm_connections, keyed the same as var.kms_ekm_connections except keys with no service_resolvers are omitted"
  value       = { for k, v in google_kms_ekm_connection.kms_ekm_connections : k => v.service_resolvers if v.service_resolvers != null && length(v.service_resolvers) > 0 }
}

