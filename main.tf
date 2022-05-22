module "image" {
  source = "./image"
  image_stored = var.image[terraform.workspace]
}

module "container" {
  source = "./container"
  count = local.container_count
  container_name = join("-", ["docusaurus-zup", terraform.workspace, random_string.random[count.index].id])
  container_image = module.image.image_module
  container_internal_port = var.internal_port
  container_external_port = lookup(var.external_port, terraform.workspace)[count.index]
}

resource "random_string" "random" {
  count            = local.container_count
  length           = 4
  special          = false
  upper            = false
}
