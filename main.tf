terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "docusaurus" {
  name = "public.ecr.aws/zup-academy/docusaurus-zup:latest"
}

resource "random_string" "random" {
  count            = 2
  length           = 4
  special          = false
  upper            = false
}

resource "docker_container" "docusaurus" {
  count = 2
  name  = "docusaurus-${random_string.random[count.index].id}"
  image = docker_image.docusaurus.latest

  ports {
    internal = "3000"
  }
}

output "name" {
  value = docker_container.docusaurus[*].name
}

output "ip_address" {
    value = [for i in docker_container.docusaurus[*]: join(":", [i.ip_address], i.ports[*]["external"])]
}
