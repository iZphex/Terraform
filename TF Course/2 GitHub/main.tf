terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    token = "ADD_Token_Here"
}

resource "github_repository" "TF_Course" {
    name        ="TF_Course"
    description = "Created using TF"
    visibility  = "public"
}
