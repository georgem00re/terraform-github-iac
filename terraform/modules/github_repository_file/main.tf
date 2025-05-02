
resource "github_repository_file" "this" {
  repository     = var.repository_name
  file           = var.file
  branch         = var.branch_name
  commit_message = var.commit_message
  content        = var.content
}
