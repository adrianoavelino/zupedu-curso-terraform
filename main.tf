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

resource "docker_container" "docusaurus" {
  name  = "docusaurus"
  image = docker_image.docusaurus.latest

  ports {
    internal = "3000"
  }
}