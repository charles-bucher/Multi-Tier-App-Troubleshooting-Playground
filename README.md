# Multi-Tier App Troubleshooting Playground 🛠️

![AWS](https://img.shields.io/badge/AWS-CloudOps-orange) ![Terraform](https://img.shields.io/badge/Terraform-IaC-blue) ![Python](https://img.shields.io/badge/Python-Automation-green)

**5-second glance:** Hands-on AWS lab for deploying, monitoring, and troubleshooting multi-tier web applications with EC2, VPC, RDS, ELB, Terraform & CloudFormation. Focus on CloudOps, incident response, and operational excellence.

---

## 🚀 Project Overview

| Feature | What You Learn | Screenshot |
|---------|----------------|------------|
| Multi-tier AWS deployment | Deploy Frontend → Backend → Database | ![Login](screenshots/Multi_01_Login.png)<br>**Skill:** Frontend/Backend connectivity |
| Operational failure simulation | Practice incident response & root cause analysis | ![Error Logs](screenshots/Multi_03_ErrorLogs.png)<br>**Skill:** Troubleshooting EC2, IAM, RDS |
| Monitoring dashboards & alerts | Build CloudWatch dashboards & automated alerts | ![API Response](screenshots/Multi_05_APIResponse.png)<br>**Skill:** Monitoring & alert pipelines |
| CI/CD automation | Deploy & update infrastructure with Terraform | - |

---

## 🏗 System Architecture

### Primary Diagram
![Primary Diagram](diagrams/Multi-Tier_Diagram.png)  
*Shows the full multi-tier architecture: Frontend, Backend, Database, Load Balancer, and VPC layout.*

### Alternate / Detailed Diagram
![Detailed Diagram](diagrams/Multi-Tier_diagram_2.png)  
*Detailed view of network routing, subnets, security groups, and IAM role assignments.*

---

## 🏁 Quick Start

```bash
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
cd Multi-Tier-App-Troubleshooting-Playground
terraform init
terraform apply
# Verify connectivity & IAM permissions
# Start frontend/backend services & test database access
# Run troubleshooting scenarios (see below)
🛠 Troubleshooting Scenarios
Scenario	Key Skills	Screenshot
EC2 Failure Recovery	Identify & fix failed instances	
IAM Permission Errors	Debug IAM roles/policies	
Database Connectivity	Resolve RDS & network issues	
Load Balancer Health Checks	Diagnose & correct failures	
Network Routing Problems	Troubleshoot VPC & subnet routing	

📁 Project Structure
bash
Copy code
backend/      # Application tier
frontend/     # Web tier
database/     # DB scripts
diagrams/     # Architecture diagrams
docs/         # Troubleshooting playbooks
screenshots/  # Lab walkthrough images
workflows/    # CI/CD automation
main.tf       # Terraform deployment
outputs.tf    # Terraform outputs
variables.tf  # Config variables
💡 Skills Demonstrated
Multi-tier AWS deployment & IaC (Terraform / CloudFormation)

Troubleshooting EC2, RDS, IAM, ELB, networking

Monitoring & automated alert pipelines

Incident response documentation & playbooks

Python scripting & CI/CD automation

Infrastructure debugging & operational excellence

📬 Contact
GitHub: charles-bucher

Portfolio: charles-bucher.github.io

LinkedIn: charles-bucher-cloud

Email: quietopscb@gmail.com

⚖️ License
MIT License

yaml
Copy code

---
