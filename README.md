# Multi-Tier App Troubleshooting Playground 🛠️

![GitHub last commit](https://img.shields.io/github/last-commit/charles-bucher/Multi-Tier-App-Troubleshooting-Playground)
![GitHub repo size](https://img.shields.io/github/repo-size/charles-bucher/Multi-Tier-App-Troubleshooting-Playground)
![GitHub issues](https://img.shields.io/github/issues/charles-bucher/Multi-Tier-App-Troubleshooting-Playground)
![GitHub license](https://img.shields.io/github/license/charles-bucher/Multi-Tier-App-Troubleshooting-Playground)

---

## 👋 About This Project

Hands-on AWS CloudOps lab for deploying, monitoring, and troubleshooting multi-tier web apps.  
Focuses on **operational excellence**, **incident response**, and **automation**.

**Key outcomes:**

- Realistic troubleshooting scenarios  
- Multi-tier infrastructure deployment  
- Automation & monitoring pipelines  
- Portfolio-ready demonstrations  

---

## 🏗️ Architecture Diagram

![Architecture Diagram](screenshots/Multi_04_Architecture.png)

**Components:**  

- EC2 Instances (Frontend & Backend)  
- VPC / Subnets  
- RDS Database  
- ELB (Load Balancer)  
- CI/CD & Monitoring Workflows  

---

## 📂 Project Structure

Multi-Tier-App-Troubleshooting-Playground/
├─ backend/
├─ frontend/
├─ database/
├─ diagrams/
├─ docs/
├─ screenshots/
├─ workflows/
├─ main.tf
├─ outputs.tf
├─ variables.tf
├─ LICENSE
└─ README.md

yaml
Copy code

---

## 📖 Step-by-Step Instructions

### 1️⃣ Deploy Infrastructure
```bash
terraform init
terraform plan
terraform apply
Outcome: Infrastructure ready for troubleshooting (EC2, RDS, VPC, Subnets, ELB).

Screenshot:

2️⃣ Test Connectivity & Security
Verify EC2 SSH, ping, and routing.

Review Security Groups & IAM roles.

Outcome: Confirms network & security are correctly configured.

Screenshots:


3️⃣ Launch Frontend & Backend Apps
Start app services on EC2 and connect to RDS.

Outcome: Full multi-tier app operational.

Screenshots:


4️⃣ Troubleshoot Simulated Failures
EC2 instance failure

Misconfigured IAM roles

RDS downtime

Outcome: Demonstrates troubleshooting & operational thinking.

Screenshots:


5️⃣ Automation & Verification
Run Python scripts or CI/CD workflows to automate deployment and checks.

Outcome: Shows practical automation and monitoring skills.

Screenshots:


💻 Skills & Technologies
Area	Tools & Skills
Cloud	AWS EC2, VPC, ELB, RDS, IAM, CloudWatch, Lambda
IaC / Automation	Terraform, CloudFormation, Python scripting
Monitoring & Logging	CloudWatch dashboards, alerts, logs, metrics
Troubleshooting	Incident simulation, root cause analysis (RCA), SLA thinking
DevOps	CI/CD workflows, GitHub Actions

🔥 Learning Outcomes
Deploy multi-tier AWS applications

Troubleshoot operational failures & security issues

Automate provisioning & verification

Build monitoring dashboards & alerts

Document workflows for portfolios / recruiters

📸 Screenshots
Multi_01	Multi_02	Multi_03

Multi_04	Multi_05	Multi_06

Multi_07	Multi_08	Multi_09

Multi_10	Multi_11	Multi_12

Continue the same pattern for all remaining screenshots…

📬 Contact
GitHub: charles-bucher

Portfolio: charles-bucher.github.io

LinkedIn: Charles Bucher

Email: quietopscb@gmail.com

About:
Hands-on AWS CloudOps lab: deploy, monitor, and troubleshoot multi-tier web apps using EC2, VPC, Load Balancers, Terraform & CloudFormation. Focused on incident response & operational excellence.

Topics:
terraform cloudformation ec2 vpc elb rds s3 aws-lambda api-gateway event-driven sns-alert-automation operational-troubleshooting aws-cloudops-devops multi-tier-n-tier-cloud-support

yaml
Copy code

---

