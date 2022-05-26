variable "internal_port" {
  type    = map(any)
  default = {
    app = 3000,
    redis = 6379
  }
}

variable "external_port" {
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
