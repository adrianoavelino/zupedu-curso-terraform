variable "docker_image_name" {
  type = string
  default = "public.ecr.aws/zup-academy/docusaurus-zup:latest"
}
variable "internal_port" {
  type    = number
  default = 3000
}

variable "external_port" {
  type    = number
  default = 3000
}

variable "container_count" {
  type    = number
  default = 1
}
