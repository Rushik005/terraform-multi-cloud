<img width="770" height="665" alt="image" src="https://github.com/user-attachments/assets/8ce12047-b182-4f8f-be8c-4326298aaf5a" /># 🌍 Multi-Cloud Terraform Infrastructure (AWS + GCP)

This repository provides a production-ready, multi-cloud Infrastructure-as-Code (IaC) framework using Terraform, supporting AWS and GCP with dev → stage → prod promotion, CI/CD pipelines, manual approval gates, and zero-downtime deployments.

The design follows enterprise DevOps best practices, emphasizing:

- Reusability
- Environment isolation
- Security (OIDC, no static credentials)
- Cost governance
- Safe infrastructure promotion

## 🚀 Key Features

### ✅ Multi-Cloud Support
- AWS: ALB + Auto Scaling Group + Launch Templates
- GCP: HTTP Load Balancer + Managed Instance Groups (MIG)

### ✅ Environment Parity
- Identical architecture across dev, stage, and prod
- Only scale, CIDR, and sizing differ

### ✅ Blue/Green Deployments (GCP)
- Surge-based MIG rolling updates
- Zero downtime
- Fast rollback

### ✅ Terraform CI/CD
- Auto-plan on PRs and commits
- Manual approval for applies
- Promotion-based pipeline (dev → stage → prod)

### ✅ Secure Authentication
- AWS: GitHub OIDC → IAM Role (no access keys)
- GCP: Workload Identity Federation / ADC

No secrets stored in the repository

### ✅ Governance & Cost Control
- Mandatory cost-allocation tags/labels
- Environment-scoped credentials
- Audit-friendly workflows

## 📁 Repository Structure
<img width="770" height="665" alt="image" src="https://github.com/user-attachments/assets/297632f2-9241-488f-9e51-abdac9e96e65" />


## 🧱 Architecture Overview
### AWS
- VPC + Subnets
- Application Load Balancer (ALB)
- Launch Template
- Auto Scaling Group (ASG)
- Health checks and self-healing

### GCP
- VPC + Subnet
- Global HTTP Load Balancer
- Managed Instance Group (MIG)
- Autoscaling based on CPU
- Health-check driven instance replacement

## 🔄 Environment Strategy
Environment	Purpose	Scale
dev	Development & testing	Small
stage	Pre-production validation	Medium
prod	Production workloads	Large

### Rule:
- Architecture never changes. Only values do.

## 🔐 Authentication & Security
### AWS
- GitHub Actions uses OIDC to assume IAM roles
- One role per environment:
     - github-terraform-dev
     - github-terraform-stage
     - github-terraform-prod
- No long-lived access keys

### GCP
- Local: Application Default Credentials (ADC)
- CI/CD: Workload Identity Federation or service account
- Environment-scoped permissions

🚫 No credentials are committed to this repository

## 🤖 CI/CD Workflows
### 1️⃣ Terraform Auto-Plan
**File:** .github/workflows/terraform-autoplan.yml

Runs automatically on:
- Pull requests
- Commits to main

Actions:
- terraform init
- terraform validate
- terraform plan

✔ No infrastructure changes
✔ Fast feedback for reviewers

### 2️⃣ Terraform Apply (Promotion Pipeline)
**File:** .github/workflows/terraform-apply.yml

Triggered manually.

Flow:
- **Dev → Stage → Prod**


Features:
- Separate plan and apply jobs
- Manual approval gates via GitHub Environments
- Environment-scoped credentials
- Full audit trail

## 🏷️ Cost Allocation & Governance
Mandatory tags/labels enforced via Terraform validation:
### AWS Tags
- Environment
- CostCenter
- ManagedBy

### GCP Labels
- environment
- cost_center
- managed_by

Terraform fails if these are missing.

## 🧑‍💻 CI/CD Usage
- Open PR → auto-plan runs
- Review Terraform plan
- Merge to main
- Trigger terraform-apply.yml
- Approve dev → stage → prod

