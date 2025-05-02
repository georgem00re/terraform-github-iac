
variable "GH_PERSONAL_ACCESS_TOKEN" {}
variable "GH_OWNER_NAME" {}
variable "REPOSITORY_NAME" {}
variable "REPOSITORY_DESCRIPTION" {}

terraform {
  required_version = ">= 1.4.0"
  backend "local" {}
}

provider "github" {
  token = var.GH_PERSONAL_ACCESS_TOKEN
  owner = var.GH_OWNER_NAME
}

module "github_repository" {
  source      = "./modules/github_repository"
  name        = var.REPOSITORY_NAME
  description = var.REPOSITORY_DESCRIPTION

  // This creates a 'master' branch and an empty README.md file.
  auto_init = true
}

module "github_repository_file" {
  source          = "./modules/github_repository_file"
  branch_name     = "master"
  repository_name = module.github_repository.name
  commit_message  = "Create an empty .gitignore file"
  file            = ".gitignore"
  content         = "" # Empty file.
}
