# Multi-Tier App Troubleshooting Playground 🚀

[![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE) 
[![AWS](https://img.shields.io/badge/AWS-CloudOps-orange?logo=amazon-aws)](https://aws.amazon.com/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-blue?logo=terraform)](https://www.terraform.io/)
[![GitHub Stars](https://img.shields.io/github/stars/charles-bucher/Multi-Tier-App-Troubleshooting-Playground?style=social)](https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/stargazers)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/charles-bucher-cloud)

---

## 🎯 Purpose
Hands-on AWS learning lab demonstrating **cloud support skills**.  
Deploy a multi-tier app, troubleshoot real-world scenarios, and practice Infrastructure as Code (IaC) in a safe environment.

**Target Roles:** Cloud Support Engineer, CloudOps, Technical Support (Cloud)

---

## 🖼️ Architecture Overview

![Multi-Tier Architecture](screenshots/architecture.png)

**3-Tier Design:**
- **Frontend:** Apache Web Server (:80)
- **Backend:** Node.js App Server (:8080)
- **Database:** PostgreSQL (:5432)

**Key Features:**
- Security groups isolating each layer
- IAM role-based access
- CloudWatch monitoring enabled

Full architecture: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)

---

## ⚡ Quick Start (Deploy in ~5 minutes)

```bash
# Clone repository
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
cd Multi-Tier-App-Troubleshooting-Playground

# Deploy infrastructure
terraform init
terraform apply -auto-approve

# Retrieve instance IPs
terraform output
💰 Cost: Free Tier eligible (~$0/month if torn down after use)
📄 Full instructions: docs/QUICK_START.md

🔍 Real Troubleshooting Scenarios
Scenario	Problem	Root Cause	Resolution	Avg Time
Website Down	Connection timeout	Missing HTTP rule in SG	Added port 80 inbound rule	8 min
SSH Fails	Permission denied	Incorrect .pem file permissions	Fixed with icacls	3 min
Backend Timeout	Frontend can't reach backend	Missing SG rule	Added backend SG rule	12 min
High CPU	98% CPU usage	App infinite loop	Restarted app, deployed fix	15 min
S3 Access Denied	Can't read S3 bucket	No IAM role on EC2	Created & attached IAM role	10 min

Visual Demo of Scenario 1:

Full scenarios: docs/TROUBLESHOOTING_SCENARIOS.md

🛠️ Skills Demonstrated
Technical Skills

EC2 instance management & SSH access

Security group & IAM role configuration

Multi-tier networking & VPC design

CloudWatch monitoring & alerts

Terraform IaC & AWS CLI (PowerShell)

Support Skills

Systematic troubleshooting & incident response

Root cause analysis

Customer-focused resolution documentation

Full skill inventory: docs/SKILLS_SUMMARY.md

📊 Project Stats
Metric	Value
Architecture Tiers	3 (Frontend, Backend, Database)
Troubleshooting Scenarios	5 documented
Avg Resolution Time	9.6 min
Deployment Time	5 min
Lines of Terraform	500+

🎓 Learning Outcomes
After deploying this project, you will understand:

Multi-tier application architecture & AWS dependencies

IAM role management & security best practices

Systematic troubleshooting methodology

Infrastructure as Code with Terraform

Cloud monitoring & operational excellence

Common cloud support scenarios

🔗 Related Projects
aws_monitoring_observability – CloudWatch monitoring

cloudOps-guardDuty-automation – Security automation

cloud-support-troubleshooting-toolkit – Diagnostic tools

👤 About
Charles Bucher – Aspiring Cloud Support Engineer

Portfolio: charles-bucher.github.io
LinkedIn: charles-bucher-cloud
Email: quietopscb@gmail.com

Open to: Cloud Support Engineer, CloudOps, Technical Support (remote)

⭐ If this repo helped you learn cloud support skills, please star it!

yaml
