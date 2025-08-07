terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Pull the Nginx image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Run the Nginx container
resource "docker_container" "nginx" {
  name  = "my-nginx"
  image = docker_image.nginx.latest

  ports {
    internal = 80
    external = 8080
  }
}
