# Terraform OCI VCN

Terraform module to provision a Oracle Cloud Virtual Networks.

## Usage:

Using default address:

```hcl
module "vcn" {
  source = "github.com/ecanuto/terraform-oci-vcn"

  compartment_id = var.compartment_id
  display_name   = "vcn-default"
  dns_label      = "default"
  cidr_blocks    = ["10.0.0.0/16"]

  create_internet_gateway = true
}
```

## Requirements

terraform >= 1.1.0  
oracle/oci >= 4.75.0
