module "image" {
  source = "./image"
  image_stored = var.image[terraform.workspace]
}

module "container" {
  source = "./container"
  container_count = local.container_count
  container_image = module.image.image_module
  container_internal_port = var.internal_port
  container_external_port = lookup(var.external_port, terraform.workspace)
}
