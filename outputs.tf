output "container_name" {
  value = docker_container.docusaurus[*].name
}

output "ip_address" {
  value = [for i in docker_container.docusaurus[*] : join(":", [i.ip_address], i.ports[*]["external"])]
}
