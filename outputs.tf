output "container_name" {
  value = module.container[*].container_module.name
}

output "container_redis" {
  value = module.redis[*].container_redis.name
}

output "ip_address" {
  value = [for i in module.container[*].container_module : join(":", [i.ip_address], i.ports[*]["external"])]
}
