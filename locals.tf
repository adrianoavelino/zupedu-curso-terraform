locals {
  container_count = length(lookup(var.external_port, terraform.workspace))
}
