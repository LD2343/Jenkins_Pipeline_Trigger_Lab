# 🔧 Jenkins Pipeline Trigger Lab

This is a Jenkins Webhook Pipeline deployment lab. This lab serves as evidence that I understand how to do the following:

- 🏗️ Deploy a Jenkins Server w/ install/setup script via Terraform.
- ⚙️ Setup a Jenkins Pipeline that will be triggered by a GitHub webhook.
- 🔗 Successfully setup a GitHub repo with webhook settings.
- 🚀 Successfully trigger a Jenkins Pipeline via empty commit to this repo.

---

## 📋 Overview

| What | How |
|------|-----|
| Jenkins server | Deployed on AWS EC2 via Terraform |
| Infrastructure | VPC, subnet, internet gateway, route tables, security group |
| Pipeline trigger | GitHub webhook on push event |
| Pipeline definition | `Jenkinsfile` at repo root |
| Cleanup | `terraform destroy` tears everything down |

---

## 📁 Folder Structure

```
Jenkins_Pipeline_Trigger_Lab/
│
├── 📄 Jenkinsfile                        # Jenkins pipeline definition (stages, steps)
├── 📄 00-auth.tf                         # AWS provider / authentication (pipeline-side)
├── 📄 01-main.tf                         # Terraform S3 Bucket w/ files (pipeline-side)
│
├── 🏗️  jenkins_server_terraform/          # Terraform for the Jenkins EC2 server
│   ├── 00-auth.tf                        # AWS provider authentication
│   ├── 01-vpc.tf                         # VPC configuration
│   ├── 02-subnet.tf                      # Public subnet
│   ├── 03-gateway.tf                     # Internet gateway
│   ├── 04-route.tf                       # Route table & associations
│   ├── 05-sg.tf                          # Security group (SSH + HTTP 8080)
│   ├── 06-ec2.tf                         # EC2 instance definition
│   ├── 98-variables.tf                   # Input variables
│   ├── 99-outputs.tf                     # Outputs (e.g., public IP)
│   └── jenkins-setup.sh                  # User data script — installs Jenkins + plugins
│
├── 📸 lab_evidence/                       # Screenshots documenting the full lab workflow
│   ├── 01-Terraform_Deployment_Jenkins_Server.png
│   ├── 02-Running_EC2_Jenkins_Server.png
│   ├── 03-Jenkins_Active_EC2_Instance_Connect.png
│   ├── 04-Jenkins_Access_With_Plugins_Installed_via_Script.png
│   ├── 05-Jenkins_Pipeline_Configuration.png
│   ├── 06-Github_Webhook_Configuration.png
│   ├── 07-Empty_Commit_Github.png
│   ├── 08-Jenkins_Pipeline_Deployment_Successful.png
│   ├── 09-Jenkins_Pipeline_Deployment_Successful.png
│   ├── 10-Deployed_S3_Evidence_Bucket.png
│   ├── 11-Proof_Theo_Pass_Approval.png
│   ├── 12-Student_Group_Verification_Armageddon_Link.png
│   └── 13-Jenkins_Pipeline_Destroy.png
│
└── 📂 armageddon_evidence_files/          # Theo's Approval (folder used in S3 terraform deployment)
    ├── Armageddon_Group_Link.txt
    └── Theo_Armageddon_Approval.png
```
