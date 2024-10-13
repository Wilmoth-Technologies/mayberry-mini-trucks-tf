variable "project" {
  type = string
  description = "project name"
  nullable = false
}

variable "region" {
  type = string
  description = "region name"
  default = "us-east4"
  nullable = false
}

variable "artifact_repo" {
  type = string
  description = "artifact registry repo name"
  nullable = false
}

variable "repo_format" {
  type = string
  description = "artifact registry format type"
  nullable = false
  default = "Docker"
  
  validation {
    condition = contains(["Docker", "Maven", "npm", "Python", "Apt", "Yum", "Go"], var.repo_format)  
    error_message = "Invalid artifact registry repository format: valid options are 'Docker', 'Maven', 'npm', 'Python', 'Apt', 'Yum', or 'Go'"
  }
}