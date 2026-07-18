variable "compartment_id" {
  description = "OCID of the compartment in which to create the service gateway."
  type        = string
}

variable "vcn_id" {
  description = "OCID of the VCN the service gateway belongs to."
  type        = string
}

variable "display_name" {
  description = "Human-readable name for the service gateway."
  type        = string
}

variable "service_ids" {
  description = "List of OCI service OCIDs (from the objectstorage/all-services list) the gateway routes to."
  type        = list(string)

  validation {
    condition     = length(var.service_ids) > 0
    error_message = "At least one service OCID must be provided."
  }
}

variable "route_table_id" {
  description = "OCID of the route table the gateway uses. Null uses the VCN default."
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "Free-form tags applied to the service gateway."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags applied to the service gateway, keyed as \"namespace.key\"."
  type        = map(string)
  default     = {}
}
