🌍 Multi-Cloud Terraform Infrastructure (AWS + GCP)

This repository provides a production-ready, multi-cloud Infrastructure-as-Code (IaC) framework using Terraform, supporting AWS and GCP with dev → stage → prod promotion, CI/CD pipelines, manual approval gates, and zero-downtime deployments.

The design follows enterprise DevOps best practices, emphasizing:

Reusability

Environment isolation

Security (OIDC, no static credentials)

Cost governance

Safe infrastructure promotion

🚀 Key Features

✅ Multi-Cloud Support

AWS: ALB + Auto Scaling Group + Launch Templates

GCP: HTTP Load Balancer + Managed Instance Groups (MIG)

✅ Environment Parity

Identical architecture across dev, stage, and prod

Only scale, CIDR, and sizing differ

✅ Blue/Green Deployments (GCP)

Surge-based MIG rolling updates

Zero downtime

Fast rollback

✅ Terraform CI/CD

Auto-plan on PRs and commits

Manual approval for applies

Promotion-based pipeline (dev → stage → prod)

✅ Secure Authentication

AWS: GitHub OIDC → IAM Role (no access keys)

GCP: Workload Identity Federation / ADC

No secrets stored in the repository

✅ Governance & Cost Control

Mandatory cost-allocation tags/labels

Environment-scoped credentials

Audit-friendly workflows

📁 Repository Structure
.
├── modules/

│   ├── aws-network/

│   ├── aws-alb/

│   ├── aws-asg/

│   ├── gcp-network/

│   ├── gcp-lb/

│   └── gcp-mig/

│

├── envs/

│   ├── dev/

│   │   ├── aws/

│   │   └── gcp/

│   ├── stage/

│   │   ├── aws/

│   │   └── gcp/

│   └── prod/

│       ├── aws/

│       └── gcp/

│

├── .github/

│   └── workflows/

│       ├── terraform-autoplan.yml

│       └── terraform-apply.yml

│

└── README.md
