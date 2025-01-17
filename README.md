## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.5 |
| <a name="requirement_dns"></a> [dns](#requirement\_dns) | >= 3.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dns"></a> [dns](#provider\_dns) | 3.2.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [dns_a_record_set.www](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/resources/a_record_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | (Optional) Algorithm of the key that will be used for authentication with the DNS server | `string` | `"hmac-sha256"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | (Requried) Name of the key that will be used for authentication with the DNS server | `string` | `"rndc-key."` | no |
| <a name="input_key_secret"></a> [key\_secret](#input\_key\_secret) | (Requried) Key secret used to authenticate with the DNS server | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Optional) The name of the record set. The zone argument will be appended to this value to create the full record path. | `string` | `"www"` | no |
| <a name="input_path"></a> [path](#input\_path) | path of json files | `string` | `"examples/exercise/input-json/*.json"` | no |
| <a name="input_server"></a> [server](#input\_server) | (Required) The hostname or IP address of the DNS server to send updates to | `string` | `"192.168.1.74"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_record_set"></a> [record\_set](#output\_record\_set) | added/udpated record set 
