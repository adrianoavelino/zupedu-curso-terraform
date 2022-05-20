
variable "internal_port" {
  type    = number
  default = 3000
}

variable "external_port" {
  type    = map(any)
  default = {
    dev = [3000, 3001], 
    qa = [4000, 4001]
  }
}

variable "image" {
  type = map(any)
  default = {
    dev = "public.ecr.aws/zup-academy/docusaurus-zup:dev"
    qa = "public.ecr.aws/zup-academy/docusaurus-zup:qa"
  }
}
