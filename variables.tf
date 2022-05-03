# ------------------------------------------
# Write your Terraform variable inputs here
# ------------------------------------------

variable "server" {
  type        = string
  default     = "192.168.1.74"
  description = "(Required) The hostname or IP address of the DNS server to send updates to"
}

variable "key_secret" {
  sensitive   = true
  type        = string
  description = "(Requried) Key secret used to authenticate with the DNS server"
}

variable "key_name" {
  type        = string
  sensitive   = true
  default     = "rndc-key."
  description = "(Requried) Name of the key that will be used for authentication with the DNS server"
}

variable "key_algorithm" {
  type        = string
  default     = "hmac-sha256"
  description = "(Optional) Algorithm of the key that will be used for authentication with the DNS server"
}

variable "name" {
  type        = string
  default     = "www"
  description = "(Optional) The name of the record set. The zone argument will be appended to this value to create the full record path."
}

variable "path" {
  type        = string
  default     = "examples/exercise/input-json/*.json"
  description = "path of json files"
}

