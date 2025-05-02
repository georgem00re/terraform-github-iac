
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
  source                      = "./modules/github_repository"
  name                        = var.REPOSITORY_NAME
  description                 = var.REPOSITORY_DESCRIPTION
  allow_merge_commit          = false
  allow_squash_merge          = true
  has_issues                  = true
  squash_merge_commit_message = "BLANK"
  squash_merge_commit_title   = "PR_TITLE"

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

module "github_branch_protection" {
  source          = "./modules/github_branch_protection"
  repository_name = module.github_repository.name
  branch_name     = "master"
}
