resource "docker_image" "docusaurus" {
  name = var.docker_image_name
}

resource "random_string" "random" {
  count            = local.container_count
  length           = 4
  special          = false
  upper            = false
}

resource "docker_container" "docusaurus" {
  count = local.container_count
  name  = "docusaurus-${random_string.random[count.index].id}"
  image = docker_image.docusaurus.latest

  ports {
    internal = var.internal_port
    external = var.external_port[count.index]
  }
}

