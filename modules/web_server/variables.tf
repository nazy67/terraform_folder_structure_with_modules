variable "env" {
    description = "name of the env"
    type = string
}
variable "instance_type" {
    description = "instance type"
    type = string
}

variable "remote_state" {
  type = map(string)
}