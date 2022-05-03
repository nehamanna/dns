# Configure the DNS Provider
provider "dns" {
  update {
    server = "127.0.0.1"
  }
}

module "dns_updater" {
  
  source = "../../."
}