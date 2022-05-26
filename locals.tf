locals {
  container_count = length(lookup(var.external_port2, terraform.workspace).app)
  container_redis_count = length(lookup(var.external_port2, terraform.workspace).redis)
}
