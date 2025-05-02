
resource "github_repository" "this" {
  name = var.name
  description = var.description
  auto_init = var.auto_init
}
