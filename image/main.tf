resource "docker_image" "docusaurus" {
  name = lookup(var.image_ambiente, terraform.workspace)
}

resource "docker_container" "docusaurus" {
  count = var.image_count
  name  = join("-", ["docusaurus-zup", terraform.workspace, random_string.random[count.index].id])
  image = docker_image.docusaurus.latest

  ports {
    internal = var.image_internal_port
    external = lookup(var.image_external_port, terraform.workspace)[count.index]
  }
}

resource "random_string" "random" {
  count            = var.image_count
  length           = 4
  special          = false
  upper            = false
}
