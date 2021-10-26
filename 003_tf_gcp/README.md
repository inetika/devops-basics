# GCP
## Create service account
1. IAM & Admin -> Service Accounts
1. Create new service account
1. Add Compute Engine role
1. Add JSON type key
1. Move that key to `~/.gcp/filename.json`

## Terraform
1. Install terraform, basic commands
1. Add provider definition
1. Create the basic instance
1. **Change without replace:** add label
1. **Change with replace:** add startup script
1. Add firewall rule
1. Destroy all resources

## Prereqs
1. Install VSCode
    https://code.visualstudio.com/download
1. Install terraform and go over the intro page/video
    https://www.terraform.io/downloads.html
    https://www.terraform.io/intro/index.html
1. Install Brew
    https://brew.sh

## Links
https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall

## Homework
1. Apply the same to AWS
https://learn.hashicorp.com/collections/terraform/aws-get-started?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS
1. DevOps RealTV: Only **2** questions this time

## Tips:
1. Keep region `us-east-2` for simplicity
1. AMI for Amazon Linux: `ami-0721c9af7b9b75114`
1. Add only minimum required fields
1. Use below block to install nginx
    ```
    user_data = <<-EOF
    #!/bin/bash
    ... your commands here
    EOF     
    ```
1. Create security group with the HTTP and SSH ingress and assign to the instance
    https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group