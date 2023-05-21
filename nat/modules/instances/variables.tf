variable "instance_type" {
  description = "Type of VM instance (e2-micro, e2-small, e2-medium)"
  type        = string
  default     = "e2-micro"
}

variable "instance_number" {
  description = "Number of instances to create"
  type        = number
  default     = 2
}

variable "instance_image" {
  description = "Image of instance"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "network_id" {
  description = "Network"
  type        = string
}

variable "subnetwork_id" {
  description = "Subnetwork"
  type = string
}
