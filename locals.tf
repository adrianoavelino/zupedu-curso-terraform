locals {
  image_type = {
    docusaurus = {
      container_count = length(lookup(var.external_port["docusaurus"], terraform.workspace))
      image = var.image["docusaurus"][terraform.workspace]
      internal = var.internal_port["docusaurus"]
      external = var.external_port["docusaurus"][terraform.workspace]
    }

    redis = {
      container_count = length(lookup(var.external_port["redis"], terraform.workspace))
      image = var.image["redis"][terraform.workspace]
      internal = var.internal_port["redis"]
      external = var.external_port["redis"][terraform.workspace]
    }
  }
}
