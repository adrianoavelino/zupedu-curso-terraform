output "image_info_name" {
  value = docker_container.docusaurus[*].name
}

output "image_info_network" {
  value = [for i in docker_container.docusaurus[*] : join(":", [i.ip_address], i.ports[*]["external"])]
}
