variable "compartment_id" {
  type        = string
  description = "Compartment id where to create all resources."
}

variable "defined_tags" {
  type        = map(string)
  default     = null
  description = "Predefined and scoped to a namespace to tag the resources created using defined tags."
}

variable "freeform_tags" {
  type        = map(any)
  default     = null
  description = "Simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
}

variable "display_name" {
  type        = string
  default     = "vcn-module"
  description = "User-friendly name of to use for the vcn."
  validation {
    condition     = length(var.display_name) > 0
    error_message = "The display_name value cannot be an empty string."
  }
}

variable "dns_label" {
  type        = string
  default     = "vcnmodule"
  description = "A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet"

  validation {
    condition     = length(regexall("^[^0-9][a-zA-Z0-9_]+$", var.dns_label)) > 0
    error_message = "DNS label must be an alphanumeric string that begins with a letter."
  }
}

variable "cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "The list of IPv4 CIDR blocks the VCN will use."
}

variable "create_internet_gateway" {
  type        = bool
  default     = false
  description = "Whether to create the internet gateway in the vcn. If set to true, creates an Internet Gateway."
}
