resource "aws_codebuild_source_credential" "repository_credentials" {
  auth_type   = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token       = var.access_token_id
}

resource "aws_codebuild_project" "codebuild_demo" {
  name           = "${var.project}-anchore-demo"
  description    = "CodeBuild demo with Anchore Integration"
  build_timeout  = "60"
  queued_timeout = "60"
  badge_enabled  = true

  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type           = "S3"
    location       = trimprefix("${aws_s3_bucket.codebuild_artifacts_output.id}", "aws:s3:::")
    name           = var.artifact_path
    namespace_type = "BUILD_ID"
    path           = "codebuild-results/scan_results.zip"
    packaging      = "ZIP"
  }
  # artifacts {
  #   type = "NO_ARTIFACTS"
  # }

  cache {
    type  = "NO_CACHE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "ANCHORE_CLI_URL"
      value = var.anchore_endpoint
    }

    environment_variable {
      name  = "ANCHORE_CLI_USER"
      value = var.anchore_cli_user
    }

    environment_variable {
      name  = "ANCHORE_CLI_PASS"
      value = var.anchore_cli_passwd
    }

    environment_variable {
      name  = "ANCHORE_CLI_SSL_VERIFY"
      value = "false"
    }

    environment_variable {
      name  = "ANCHORE_TIMEOUT"
      value = "300"
    }

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = var.image_repo_name
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = var.image_tag
    }

    environment_variable {
      name  = "ANCHORE_FAIL_ON_POLICY"
      value = var.anchore_fail_on_policy
    }
  }

  source {
    type            = "GITHUB"
    location        = var.git_url
    git_clone_depth = 1
    report_build_status = false
  }

  source_version = var.git_branch

  tags = {
    Environment = "Test"
  }
}