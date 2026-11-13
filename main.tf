# Create Docker Network

resource "docker_network" "main" {
  name = "${var.project_name}-network"
}

# Create Docker Volume

resource "docker_volume" "nginx_logs" {
  name = "${var.project_name}-logs"
}

# Download Nginx Image

resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

# Create Nginx Container

resource "docker_container" "website" {

  name  = "${var.project_name}-website"
  image = docker_image.nginx.image_id

  restart = "unless-stopped"

  ports {
    internal = 80
    external = var.host_port
  }

  networks_advanced {
    name = docker_network.main.name
  }

  # Website files from our local project

  volumes {
    host_path      = abspath("${path.module}/website")
    container_path = "/usr/share/nginx/html"
    read_only      = true
  }

  # Persistent Nginx logs

  volumes {
    volume_name    = docker_volume.nginx_logs.name
    container_path = "/var/log/nginx"
  }

}