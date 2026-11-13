output "website_url" {
  description = "URL of the deployed website"
  value       = "http://localhost:${var.host_port}"
}

output "docker_network" {
  description = "Created Docker network"
  value       = docker_network.main.name
}

output "docker_volume" {
  description = "Created Docker volume"
  value       = docker_volume.nginx_logs.name
}

output "container_name" {
  description = "Created Nginx container"
  value       = docker_container.website.name
}