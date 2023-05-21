variable "project_id" {
  description = "ID of the project"
  type        = string
  default     = "managment-382811"
}

variable "region" {
  description = "Region of instances"
  type        = string
  default     = "europe-central2"
}

variable "zone" {
  description = "Zone of the region"
  type        = string
  default     = "europe-central2-b"
}

variable "instance_image" {
  description = "Image of instance"
  type        = string
  default     = "ubuntu-2204-lts"
}