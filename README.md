# terraform-oci-service-gateway

Terraform module that manages an [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/)
service gateway inside an existing VCN, giving private resources access to the Oracle
Services Network (Object Storage, Autonomous Database, and more) without traversing the
public internet.

## Usage

```hcl
data "oci_core_services" "all" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

module "service_gateway" {
  source = "github.com/cybercapybara/terraform-oci-service-gateway"

  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "prod-sgw"
  service_ids    = [data.oci_core_services.all.services[0].id]

  freeform_tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| oci       | >= 5.0   |

## Inputs

| Name             | Description                                                        | Type           | Default | Required |
|------------------|--------------------------------------------------------------------|----------------|---------|:--------:|
| `compartment_id` | OCID of the compartment in which to create the service gateway.    | `string`       | n/a     |   yes    |
| `vcn_id`         | OCID of the VCN the service gateway belongs to.                    | `string`       | n/a     |   yes    |
| `display_name`   | Human-readable name for the service gateway.                       | `string`       | n/a     |   yes    |
| `service_ids`    | List of OCI service OCIDs the gateway routes to.                   | `list(string)` | n/a     |   yes    |
| `route_table_id` | Route table OCID the gateway uses. Null uses the VCN default.      | `string`       | `null`  |    no    |
| `freeform_tags`  | Free-form tags applied to the service gateway.                     | `map(string)`  | `{}`    |    no    |
| `defined_tags`   | Defined tags applied to the gateway, keyed `namespace.key`.        | `map(string)`  | `{}`    |    no    |

## Outputs

| Name           | Description                             |
|----------------|-----------------------------------------|
| `id`           | OCID of the service gateway.            |
| `display_name` | Display name of the service gateway.    |
| `services`     | Services enabled on the service gateway.|
| `state`        | Lifecycle state of the service gateway. |

## License

[MIT](LICENSE)
