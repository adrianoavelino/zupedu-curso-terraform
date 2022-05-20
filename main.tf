module "image" {
  source = "./image"
  image_stored = var.image[terraform.workspace]
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
  image = module.image.image_module

  ports {
    internal = var.internal_port
    external = lookup(var.external_port, terraform.workspace)[count.index]
  }
}
