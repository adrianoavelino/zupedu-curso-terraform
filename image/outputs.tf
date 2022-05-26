output "image_module" {
  value = docker_image.docusaurus.latest
}

output "redis_module" {
  value = docker_image.docusredis.latest
}
