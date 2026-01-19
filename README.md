# Terraform IaC for Multi-Environment AWS & GCP
This repository demonstrates a modular Terraform design to provision
and manage infrastructure across AWS and GCP with clear environment
separation (dev / stage / prod).

## Features
- Modular Terraform architecture
- AWS and GCP support
- Secure remote state with locking
- Environment-specific configurations
- Reusable and scalable design

## Environments
Each environment is isolated using:
- Separate state backend
- Separate variable files
- Same reusable modules

## Usage
```bash
terraform init
terraform plan
terraform apply
