
# Deploying a Static Website to AWS S3 using Terraform

This project demonstrates deploying a static website to AWS S3 using Terraform for infrastructure provisioning and management. It also includes scripts to automate file deployment and version control using Git.

---

## Project Overview

- **AWS Provider**: Terraform provisions AWS resources.
- **S3 Bucket**: Hosts static website files.
- **CloudFront Distribution**: Serves the website globally with HTTPS and caching.
- **Automation**: Scripts handle uploading files to S3 and invalidating CloudFront cache.
- **Version Control**: Git commits and pushes changes to the remote repository.

---

## Project Structure

- **AWS Provider**: Terraform provisions AWS resources.
- **S3 Bucket**: Hosts static website files.
- **CloudFront Distribution**: Serves the website globally with HTTPS and caching.
- **Automation**: Scripts handle uploading files to S3 and invalidating CloudFront cache.
- **Version Control**: Git commits and pushes changes to the remote repository.
---

## Workflow Diagram

<img width="2048" height="2048" alt="image" src="https://github.com/user-attachments/assets/280f84b6-881f-4e8e-b1e7-b82384b5b730" />



This diagram shows the full workflow: commit files → push to GitHub → Terraform provisions AWS infrastructure → S3 stores website → CloudFront distributes content globally.

---

## Deployment Steps

### 1️⃣ Provision AWS Infrastructure

Initialize Terraform:
terraform init


Apply the Terraform configuration:
terraform apply -auto-approve


---

### 2️⃣ Deploy Website Files

Use the deployment script to upload files to S3 and invalidate CloudFront cache:
./scripts/deploy.sh


---

### 3️⃣ Version Control with Git

Stage files for commit:
git add public/index.html public/about.html main.tf scripts/deploy.sh scripts/destroy.sh


Commit the changes:
git commit -m "Add static website files and deployment scripts"


Pull latest changes from remote to avoid conflicts:
git pull origin main --rebase


Push changes to remote repository:
git push origin main


> ⚡ **Tip**: If your local branch is behind and you want to overwrite the remote branch:
git push origin main --force

---

## Benefits

- **Infrastructure as Code**: Easily reproduce and track changes.
- **Automation**: Speeds up deployment and reduces errors.
- **Scalability**: Extend infrastructure easily with Terraform.
- **Version Control**: Keep track of changes using Git and push updates seamlessly.

---

## 4️⃣ Cleanup

To destroy all provisioned resources:
./scripts/destroy.sh
