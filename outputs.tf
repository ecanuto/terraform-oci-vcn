output "id" {
  description = "ID of VCN"
  value       = oci_core_vcn.vcn.id
}

output "display_name" {
  description = "Display name of VCN"
  value       = oci_core_vcn.vcn.display_name
}

output "default_security_list_id" {
  description = "Default security list id for VCN"
  value       = oci_core_vcn.vcn.default_security_list_id
}
