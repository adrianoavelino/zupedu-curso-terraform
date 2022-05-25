resource "docker_image" "docusaurus" {
  name = var.image_stored
}

resource "docker_image" "docusredis" {
  name = var.redis_stored
}
