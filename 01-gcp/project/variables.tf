variable "instance_type" {
  description = "Type of VM instance (e2-micro, e2-small, e2-medium)"
  type        = string
  default     = "e2-micro"
}

variable "number_instances" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "instance_image" {
  description = "Image of instance"
  type        = string
  default     = "centos-cloud/centos-7"
}