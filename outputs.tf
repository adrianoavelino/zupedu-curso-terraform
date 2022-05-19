output "image_module" {
   value = [for i in module.image[*]: i]
}
