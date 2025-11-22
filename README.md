# 🔧 Multi-Tier Application Troubleshooting Playground

AWS Terraform CloudFormation Python Flask Nginx MySQL CloudWatch Linux Ubuntu  

**Skill Level:** Portfolio Project | DevOps  

Hands-on AWS lab for deploying, breaking, and troubleshooting a multi-tier web application. Perfect for demonstrating real-world incident response and cloud ops skills.

---

## 📋 Table of Contents
1. Overview
2. Architecture & Component Diagrams
3. Tech Stack
4. Prerequisites
5. Step-by-Step Deployment & Walkthrough
6. Troubleshooting Scenarios
7. Project Structure
8. Cost & Optimization
9. Future Enhancements
10. Contributing
11. License

---

## 🎯 Overview
Practice deploying and troubleshooting a multi-tier web application in AWS.  
Learn how to:

- Diagnose web, app, and database tiers
- Debug networking and security misconfigurations
- Use CloudWatch for monitoring and alerting
- Automate infrastructure deployment with Terraform & CloudFormation

---

## 🏗️ Architecture & Component Diagrams

**Component Diagram**  
![Component Diagram](docs/screenshots/Multi_04_EC2_Instance_List.png)

**Network Topology**  
![Network Topology](docs/screenshots/network-topology.png)

**Traffic Flow**
Internet → ALB → Web Tier (EC2/Nginx) → App Tier (EC2/Flask) → Database (RDS MySQL) → Response


---

## 🛠️ Tech Stack

| Category       | Technology             | Purpose |
|----------------|----------------------|---------|
| Infrastructure | Terraform / CloudFormation | Reproducible deployments |
| Compute        | EC2 (Amazon Linux 2, Ubuntu) | Web & app tiers |
| Load Balancing | Application Load Balancer | High-availability traffic |
| Database       | RDS MySQL             | Managed relational DB |
| Networking     | VPC, Subnets, IGW, NAT | Secure network |
| Security       | Security Groups, IAM  | Access control |
| Monitoring     | CloudWatch, Logs, Alarms | Metrics & alerting |
| Web Server     | Nginx                 | Frontend & reverse proxy |
| Application    | Python Flask          | Backend API |
| Version Control| Git                   | Track code & infra changes |

---

## 📦 Prerequisites
- AWS Account with admin access  
- AWS CLI configured (`aws configure`)  
- Terraform v1.0+  
- Git installed  
- SSH Key Pair for EC2 access  

⚠️ Estimated monthly cost: $20–50 if resources run 24/7. Destroy after testing.

---

## 🚀 Step-by-Step Deployment & Walkthrough

### 1️⃣ Clone Repo
![Repo Cloned](docs/screenshots/Multi_01_cloned.png)

```bash
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
cd Multi-Tier-App-Troubleshooting-Playground
2️⃣ Configure AWS CLI
CLI Configured

aws configure
3️⃣ Initialize Terraform
Terraform Init

cd terraform/
terraform init
4️⃣ Plan & Apply Infrastructure
Terraform Output / Apply

terraform plan
terraform apply -auto-approve
5️⃣ Verify EC2 Instances

aws ec2 describe-instances --filters "Name=tag:Project,Values=MultiTierApp"
6️⃣ Check App & Web Tier
App Running

curl http://YOUR_ALB_DNS_NAME
7️⃣ Inspect Logs & Monitoring

Check CloudWatch logs for errors

Review metrics & alarms

🔧 Troubleshooting Scenarios
502 Bad Gateway (Web → App)

Database Connection Timeout (App → RDS)

Auto Scaling Not Triggering

Unhealthy Targets in ALB

CloudWatch Alert Fatigue

(Add scenario-specific screenshots here from docs/screenshots.)

🗂️ Project Structure
Multi-Tier-App-Troubleshooting-Playground/
│
├── docs/screenshots/        # All images for README & scenarios
├── docs/runbooks/           # Troubleshooting guides
├── terraform/               # Terraform IaC
├── cloudformation/          # CloudFormation templates
├── scripts/                 # Deployment scripts
├── app/                     # Nginx & Flask code
├── monitoring/              # Dashboards & alarms
├── .github/workflows/       # CI/CD pipelines
├── .gitignore
├── LICENSE
└── README.md                # This file
💰 Cost & Optimization
Estimated monthly cost (24/7 run): ~$122.90

Tips:

Destroy unused resources

Use smaller instances

Single AZ for testing

Remove NAT Gateway

Reduce CloudWatch metrics

🔮 Future Enhancements
X-Ray & Grafana dashboards

CI/CD pipelines with GitHub Actions & Terratest

Security hardening (Secrets Manager, VPC Flow Logs, IAM)

Cost optimization (Spot Instances, Compute Optimizer)

Multi-region deployment, ECS/EKS, serverless integration

🤝 Contributing
Open issues for bugs or feature requests

Add new troubleshooting scenarios with screenshots & runbooks

Submit pull requests

📄 License
MIT License – see LICENSE file

