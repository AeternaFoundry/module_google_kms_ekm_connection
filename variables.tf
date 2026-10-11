variable "kms_ekm_connections" {
  description = <<EOT
Map of kms_ekm_connections, attributes below
Required:
    - location
    - name
    - service_resolvers (block):
        - endpoint_filter (optional)
        - hostname (required)
        - server_certificates (required, block):
            - raw_der (required)
            - subject_alternative_dns_names (optional)
        - service_directory_service (required)
Optional:
    - crypto_space_path
    - etag
    - key_management_mode
    - project
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location            = string
    name                = string
    crypto_space_path   = optional(string)
    etag                = optional(string)
    key_management_mode = optional(string)
    project             = optional(string)
    service_resolvers = list(object({
      endpoint_filter = optional(string)
      hostname        = string
      server_certificates = list(object({
        raw_der                       = string
        subject_alternative_dns_names = optional(list(string))
      }))
      service_directory_service = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.kms_ekm_connections : (
        length(v.service_resolvers) >= 1
      )
    ])
    error_message = "Each service_resolvers list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kms_ekm_connections : (
        alltrue([for item in v.service_resolvers : (length(item.server_certificates) >= 1)])
      )
    ])
    error_message = "Each server_certificates list must contain at least 1 items"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

