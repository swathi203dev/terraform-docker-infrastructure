variable "project_name" {
  description = "Name of the infrastructure project"
  type        = string
  default     = "swathi-terraform-infra"
}

variable "host_port" {
  description = "Port used to access the website"
  type        = number
  default     = 8089
}