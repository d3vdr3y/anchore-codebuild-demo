# anchore-codebuild-demo

**Requirements:**
- Anchore Engine/Enterprise deployment
- Account and user(s) added to your Anchore deployment (optionally, the default user can be used to access the API)
- Access to the Anchore Engine/Enterprise API endpoint from the CodeBuild service
- An existing Elastic Container Registry repository in the region the CodeBuild service will run from
- ECR registry credentials added to the Anchore Deployment (See: https://docs.anchore.com/current/docs/using/cli_usage/registries/ecr_configuration/)
- A GitHub personal access token used to authenticate to the GitHub repository (See: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)
- An S3 Bucket that will be used to store the image evaluation results as a build output
- The IAM role used by CodeBuild must have access to the ECR registry to pull/push the image and access to S3 to store the build artifacts (This is automatically created using the included Terraform template)
