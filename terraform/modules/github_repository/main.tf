
resource "github_repository" "this" {
  name                        = var.name
  description                 = var.description
  auto_init                   = var.auto_init
  has_issues                  = var.has_issues
  allow_squash_merge          = var.allow_squash_merge
  allow_merge_commit          = var.allow_merge_commit
  squash_merge_commit_title   = var.squash_merge_commit_title
  squash_merge_commit_message = var.squash_merge_commit_message
}
