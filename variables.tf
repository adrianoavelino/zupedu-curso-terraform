variable "internal_port" {
  type    = number
  default = 3000
}

variable "internal_port2" {
  type    = map(any)
  default = {
    app = 3000,
    redis = 6379
  }
}

variable "external_port" {
  type    = map(any)
  default = {
    dev = [3000, 3001], 
    qa = [4000, 4001]
  }
}

variable "external_port2" {
  type    = map(map(any))
  default = {
    dev = {
      app =[3000, 3001], 
      redis = [6379]
    }
    
    qa = {
      app = [4000, 4001]
      redis = [7379]
    }
    
  }
}

variable "image" {
  type = map(any)
  default = {
    dev = "public.ecr.aws/zup-academy/docusaurus-zup:dev"
    qa = "public.ecr.aws/zup-academy/docusaurus-zup:qa"
  }
}

variable "image2" {
  type = map(map(any))
  default = {
    dev = {
      app = "public.ecr.aws/zup-academy/docusaurus-zup:dev"
      redis = "redis:alpine" 
    }
    
    qa = {
      app = "public.ecr.aws/zup-academy/docusaurus-zup:qa"
      redis = "redis:buster"
    }
    
  }
}
