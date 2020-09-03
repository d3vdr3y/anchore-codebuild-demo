# anchore-codebuild-demo

## Workflow

- CodeBuild builds a container image from the provided Dockerfile
- The image is pushed to ECR with a development tag
- Anchore scans the image for vulnerabilities and other policy violations
- If the image passes the Anchore assessment, it is pushed to ECR with the production tag | If it fails the assessment, the vulnerability output and any policy violations are zipped and stored in S3 for retrieval

## Requirements

- Anchore Engine/Enterprise deployment
- Account and user(s) added to your Anchore deployment (optionally, the default user can be used to access the API)
- Access to the Anchore Engine/Enterprise API endpoint from the CodeBuild service
- An existing Elastic Container Registry repository in the region the CodeBuild service will run from
- ECR registry credentials added to the Anchore Deployment (See: https://docs.anchore.com/current/docs/using/cli_usage/registries/ecr_configuration/)
- A GitHub personal access token used to authenticate to the GitHub repository (See: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)
- An S3 Bucket that will be used to store the image evaluation results as a build output
- The IAM role used by CodeBuild must have access to the ECR registry to pull/push the image and access to S3 to store the build artifacts (This is automatically created using the included Terraform template)

## Terraform Requirements

- Terraform (https://www.terraform.io/downloads.html)
- AWS Command Line Interface (https://aws.amazon.com/cli/)
- A role with permissions to create the required AWS resources

## Installation

Inside the Terraform directory, create a '.tfvars' file to declare the required variables

```bash
touch terraform.tfvars
```

Update your values file with the required values defined in variables.tf

Initialize the project and plan the deployment:

```bash
terraform init
terraform plan
```

Run Terraform apply

```bash
terraform apply
```

(Note: Terraform will only deploy CodeBuild and the required resources. You can run a test build using CodeBuild from the AWS Console or via CLI)
