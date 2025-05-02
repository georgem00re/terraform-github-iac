
variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "auto_init" {
  type = bool
}

variable "allow_squash_merge" {
  type = bool
}

variable "allow_merge_commit" {
  type = bool
}

variable "squash_merge_commit_title" {
  type = string
}

variable "squash_merge_commit_message" {
  type = string
}

variable "has_issues" {
  type = bool
}
