variable "ip_instance" {
  default = "10.0.0.5"
  description = "IPv4 address for the VM instance"
  type = string
}

variable "ip_subnet" {
  default = "10.0.0.0/16"
  description = "IP address for the subnetwork"
  type = string
}

variable "my_instance" {
  type = tuple([string, number, bool])
  default = ["e2-micro", 1, true]
}

variable "allows" {
  type = object({
    protocol = string,
    ports = list(number)
  })
  default = {
    protocol = "tcp",
    ports = [22, 80, 110, 443, 993, 8080]
  }
}


variable "ports" {
  description = "List of allowed ports"
  type = list(number)
  default = [22, 80, 110, 443, 993, 8080]
}


variable "istest" {
  type = bool
}


locals {
  owner = "DevOps"
}

variable "pass" {
  type = string
  sensitive = true  
}