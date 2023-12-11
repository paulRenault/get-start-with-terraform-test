# main.tf

variable "test" {
  type = string
}

locals {
  test= "${var.test}-local"
}
