# ---------------------------------------------------------------------------------------------------------------------
# DNS server(mock) should be up and running .
# This script will fetch DNS record sets defined in json file at the given path
# It will dynamically create, delete or update DNS A-type record using the terraform resource.
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  # This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.13.5"
  required_providers {
    dns = {
      source  = "hashicorp/dns"
      version = ">= 3.2.0"
    }
  }
}

# Configure the DNS Provider
provider "dns" {
  update {
    server        = var.server
    key_name      = var.key_name
    key_algorithm = var.key_algorithm
    key_secret    = var.key_secret
  }
}

# # ------------------------------------------
# Extracts recordset from json files
# ------------------------------------------

locals {

  json_files = fileset(path.module, var.path)
  json_data  = [for files in local.json_files : jsondecode(file("${path.module}/${files}"))]
}


# --------------------------------------------------------
# Terraform resource to creates a A type DNS record set based on inputs retrieved from json files.

# Instruction set:
# Default path for json files : examples/exercise/input-json
# Add a new record: Add json files @ var.path 
# Update an existing record: Update the existing json files @ var.path
# Delete an existing record: Delete the json file for the relevent record @ var.path

# Input Reference
# zone : DNS zone the record set belongs to. It must be an FQDN, that is, include the trailing dot.
# name : The name of the record set. The zone argument will be appended to this value to create the full record path.
# addresses : The IPv4 addresses this record set will point to.
# ttl : The TTL of the record set. Defaults to 3600.
# --------------------------------------------------------

resource "dns_a_record_set" "www" {
  count = length(local.json_files)
  zone      = local.json_data[count.index].zone
  name      = trimsuffix(basename(tolist(local.json_files)[count.index]),".json")
  addresses = local.json_data[count.index].addresses
  ttl       = local.json_data[count.index].ttl
}