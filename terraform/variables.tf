variable "project" {
    description = "Name of the project"
    type        = string
    default     = "anchore-ci-demo"
}

variable "region" {
  description = "Region resources will be created in"
  type        = string
  default     = "us-east-2"
}

variable "access_token_id" {
    description = "Personal Access Token used to access the referenced GitHub Repository"
}

variable "artifact_path" {
    description = "Path CodeBuild will use to store build artifacts"
    default = "scan_results"
}

variable "git_url" {
    description = "URL for the repository to pull (e.g. https://github.com/d3vdr3y/anchore-codebuild-demo.git)"
}

variable "git_branch" {
    default = "master"
}

variable "anchore_endpoint" {}

variable "anchore_cli_user" {
    default = "admin"
}

variable "anchore_cli_passwd" {
    default = "foobar"
}

variable "image_repo_name" {
    # Current iteration requires registry to be in the same region as the build job or the runner will fail with docker basic auth error
    description = "ECR registry uri/repository name to push the image to"
    default = "1234567890.dkr.ecr.us-east-1.amazonaws.com/my-app"
}

variable "image_tag" {
    default = "dev"
}

variable "anchore_fail_on_policy" {
    default = "true"
}