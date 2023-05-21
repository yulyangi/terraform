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

variable "network_id" {
    description = "Network ID"
    type = string
}