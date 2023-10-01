# variable "usernumber" {
#   type = number             # String, list, map, number
# }

variable "elb_name" {
  type = string
}

variable "az" {
  type = list
}

variable "timeout" {
  type = number
}