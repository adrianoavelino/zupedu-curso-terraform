locals {
  container_count = length(lookup(var.external_port, terraform.workspace).app)
  container_redis_count = length(lookup(var.external_port, terraform.workspace).redis)
}
