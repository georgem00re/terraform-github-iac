
variable "GH_PERSONAL_ACCESS_TOKEN" {}
variable "GH_OWNER_NAME" {}
variable "REPOSITORY_NAME" {}

terraform {
  required_version = ">= 1.4.0"


  backend "local" {}
}

provider "github" {
  token = var.GH_PERSONAL_ACCESS_TOKEN
  owner = var.GH_OWNER_NAME
}

resource "github_repository" "example" {
  name = var.REPOSITORY_NAME
}
