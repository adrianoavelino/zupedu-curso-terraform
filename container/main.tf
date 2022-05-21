resource "docker_container" "docusaurus" {
  count = var.container_count
  name  = join("-", ["docusaurus-zup", terraform.workspace, random_string.random[count.index].id])
  image = var.container_image

  ports {
    internal = var.container_internal_port
    external = var.container_external_port[count.index]
  }
}

resource "random_string" "random" {
  count            = var.container_count
  length           = 4
  special          = false
  upper            = false
}
