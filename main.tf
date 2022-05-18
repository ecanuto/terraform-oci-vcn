terraform {
  required_version = ">= 1.1.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.75.0"
    }
  }
}

resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_id

  display_name = var.display_name
  dns_label    = var.dns_label
  cidr_blocks  = var.cidr_blocks

  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags
}

resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id

  display_name = "Internet Gateway for ${oci_core_vcn.vcn.display_name}"
  enabled      = "true"

  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags

  count = var.create_internet_gateway == true ? 1 : 0
}

resource "oci_core_default_route_table" "rt" {
  compartment_id = var.compartment_id
  display_name   = "Default Route Table for ${oci_core_vcn.vcn.display_name}"

  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.ig[0].id
  }

  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags

  count = var.create_internet_gateway == true ? 1 : 0
}
