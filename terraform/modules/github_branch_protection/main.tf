
resource "github_branch_protection" "this" {
  repository_id = var.repository_name
  pattern       = var.branch_name

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
  }
}
