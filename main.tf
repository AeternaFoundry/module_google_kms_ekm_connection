resource "google_kms_ekm_connection" "kms_ekm_connections" {
  for_each = var.kms_ekm_connections

  location            = each.value.location
  name                = each.value.name
  crypto_space_path   = each.value.crypto_space_path
  etag                = each.value.etag
  key_management_mode = each.value.key_management_mode
  project             = each.value.project

  dynamic "service_resolvers" {
    for_each = each.value.service_resolvers
    content {
      endpoint_filter = service_resolvers.value.endpoint_filter
      hostname        = service_resolvers.value.hostname
      dynamic "server_certificates" {
        for_each = service_resolvers.value.server_certificates
        content {
          raw_der                       = server_certificates.value.raw_der
          subject_alternative_dns_names = server_certificates.value.subject_alternative_dns_names
        }
      }
      service_directory_service = service_resolvers.value.service_directory_service
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

