module "image" {
  source = "./image"
  image_count = local.container_count
  image_ambiente = var.ambiente
  image_internal_port = var.internal_port
  image_external_port = var.external_port
}
