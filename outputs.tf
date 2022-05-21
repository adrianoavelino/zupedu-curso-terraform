output "container_name" {
  value =[for i in module.container.container_module : i.name]
}

output "ip_address" {
  value = [for i in module.container.container_module : join(":", [i.ip_address], i.ports[*]["external"])]
}
