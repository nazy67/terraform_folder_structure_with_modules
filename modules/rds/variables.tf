# Define root module variables

variable "env" {
    description = "the name of the environment"
    type = string
} 

variable "storage" {
    description = "the storage size of database"
    type = string
}

variable "skip_snapshot" {
    description = "it will skip the final snapshot incase if someone deletes database by accident"
    type = bool
}

variable "instance_class" {
    description = " database instance class"
    type = string
}


variable "username" {
    description = "the username of database"
    type = string
}