# Multi-Tier App Troubleshooting Playground 🛠️

[![GitHub stars](https://img.shields.io/github/stars/charles-bucher/Multi-Tier-App-Troubleshooting-Playground)](https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![AWS](https://img.shields.io/badge/AWS-CloudOps-orange)](https://aws.amazon.com)

Hands-on AWS lab to **deploy, monitor, and troubleshoot multi-tier web applications**. Focus: CloudOps, incident response, IaC, and operational excellence.

---

## 🚀 Project Overview

| Feature | What You Learn | Screenshot |
|--------|----------------|------------|
| Multi-tier AWS deployment | Deploy Frontend → Backend → Database | [![Login](screenshots/Multi_01_Login.png)](screenshots/Multi_01_Login.png) |
| Operational failure simulation | Practice incident response & root cause analysis | [![Error Logs](screenshots/Multi_03_ErrorLogs.png)](screenshots/Multi_03_ErrorLogs.png) |
| Monitoring dashboards & alerts | Build CloudWatch dashboards & automated alerts | [![API Response](screenshots/Multi_05_APIResponse.png)](screenshots/Multi_05_APIResponse.png) |
| CI/CD automation | Deploy & update infrastructure with Terraform | - |

---

## 🏗 System Architecture

**Primary Diagram:**  
![Primary Diagram](diagrams/Multi_14_Architecture.png)

**Alternate / Detailed Diagram:**  
![Detailed Diagram](diagrams/Multi_14_Architecture.png)

---

## 🏁 Quick Start

```bash
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
cd Multi-Tier-App-Troubleshooting-Playground
terraform init
terraform apply
Verify connectivity & IAM permissions

Start frontend/backend services & test database access

Run troubleshooting scenarios (see below)

🛠 Troubleshooting Scenarios
Scenario	Key Skills	Screenshot
EC2 Failure Recovery	Identify & fix failed instances	
IAM Permission Errors	Debug IAM roles/policies	
Database Connectivity	Resolve RDS & network issues	
Load Balancer Health Checks	Diagnose & correct failures	
Network Routing Problems	Troubleshoot VPC & subnet routing	

📁 Project Structure
backend/ – Application tier

frontend/ – Web tier

database/ – DB scripts

diagrams/ – Architecture diagrams

docs/ – Troubleshooting playbooks

screenshots/ – Lab walkthrough images

workflows/ – CI/CD automation

main.tf – Terraform deployment

outputs.tf – Terraform outputs

variables.tf – Config variables

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

