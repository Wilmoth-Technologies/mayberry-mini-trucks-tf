terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version= "6.6.0"
    }
  }

  backend "gcs" {
    bucket = "mayberry-tfstate"
    prefix = "terraform.tfstate"
  }
}

provider "google" {
  project = var.project
  region = var.region
}

resource "google_artifact_registry_repository" "repo" {
  location = var.region
  repository_id = var.artifact_repo
  description = "mayberry artifact repo test"
  format = var.repo_format
}

