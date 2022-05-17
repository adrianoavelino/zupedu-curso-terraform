resource "docker_image" "docusaurus" {
  name = lookup(var.ambiente, terraform.workspace)
}

resource "random_string" "random" {
  count            = local.container_count
  length           = 4
  special          = false
  upper            = false
}

resource "docker_container" "docusaurus" {
  count = local.container_count
  name  = join("-", ["docusaurus-zup", terraform.workspace, random_string.random[count.index].id])
  image = docker_image.docusaurus.latest

  ports {
    internal = var.internal_port
    external = lookup(var.external_port, terraform.workspace)[count.index]
  }
}

