module "image" {
  source = "./image"
  for_each = local.image_type
  image_stored = each.value.image
}

module "container" {
  count_stored = each.value.container_count
  for_each = local.image_type
  source = "./container"
  name_stored = each.key
  image_stored = module.image[each.key].image_module
  internal_stored = each.value.internal
  external_stored = each.value.external
}
