resource "docker_container" "docusredis" {
  name = var.container_name
  image = var.container_image

  ports {
    internal = var.container_internal_port
    external = var.container_external_port
  }
}
