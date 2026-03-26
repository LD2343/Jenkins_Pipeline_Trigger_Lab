# 🔧 Jenkins Pipeline Trigger Lab

This is a Jenkins Webhook Pipeline deployment lab. This lab serves as evidence that I understand how to do the following:

- 🏗️ Deploy a Jenkins Server w/ install/setup script via Terraform.
- ⚙️ Setup a Jenkins Pipeline that will be triggered by a GitHub webhook.
- 🔗 Successfully setup a GitHub repo with webhook settings.
- 🚀 Successfully trigger a Jenkins Pipeline via empty commit to this repo.

---

## 📋 Overview

- 🏗️ **Provisioned AWS infrastructure & Jenkins server** via Terraform — EC2, VPC, networking, and a startup script that auto-installed Jenkins with required plugins and configuration
- 🔑 **Configured Jenkins** with AWS credentials, pipeline definition (`Jenkinsfile`), and connected it to this GitHub repo
- 🔗 **Set up a GitHub webhook** to trigger the Jenkins pipeline on every push event
- 🚀 **Triggered the pipeline** via an empty commit — pipeline executed Terraform to deploy an S3 bucket loaded with verification files
- ✅ **Validated the deployment** — confirmed the pipeline ran successfully and the S3 bucket and files were live in AWS
- 🧹 **Tore down all infrastructure** — cleaned up the pipeline job and destroyed all AWS resources via `terraform destroy`

---

## 📁 Folder Structure

```
Jenkins_Pipeline_Trigger_Lab/
│
├── 📄 Jenkinsfile                        # Jenkins pipeline definition (stages, steps)
├── 📄 00-auth.tf                         # AWS provider / authentication (pipeline-side)
├── 📄 01-main.tf                         # Terraform S3 Bucket w/ files (pipeline-side)
│
├── 🏗️  jenkins_server_terraform/         # Terraform for the Jenkins EC2 server
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
└── 📂 armageddon_evidence_files/          # Theo's Approval & Armageddon Repo Link (used in S3 terraform deployment)
    ├── Armageddon_Group_Link.txt
    └── Theo_Armageddon_Approval.png
```
