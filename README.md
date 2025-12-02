Multi-Tier App Troubleshooting Playground 🛠️

Hands-on AWS lab for deploying, monitoring, and troubleshooting multi-tier web applications.
Focus: CloudOps, troubleshooting, infrastructure-as-code, and incident response.

🚀 Quick Overview
Feature	What You Learn	Screenshot
Multi-tier AWS deployment	Deploy Frontend → Backend → Database	

Operational failure simulation	Practice incident response & root cause analysis	

Monitoring dashboards & alerts	Build CloudWatch dashboards & automated alerts	

CI/CD automation	Deploy & update infrastructure with Terraform	

Tip: Clicking thumbnails can link to full-size images in screenshots/.

🏗 System Architecture

Diagram of multi-tier setup:

Legend:

🟦 EC2 Frontend

🟩 EC2 Backend

🟧 RDS Database

🔵 VPC, Subnets, Security Groups

⚡ ELB & Load Balancing

🏁 Quick Start
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
cd Multi-Tier-App-Troubleshooting-Playground
terraform init
terraform apply


Verify connectivity & IAM permissions.

Start frontend/backend services & test database access.

Run troubleshooting scenarios (see below).

🛠 Troubleshooting Scenarios
Scenario	Key Skills	Screenshot
EC2 Failure Recovery	Identify & fix failed instances	

IAM Permission Errors	Debug IAM roles/policies	

Database Connectivity	Resolve RDS & network issues	

Load Balancer Health Checks	Diagnose & correct failures	

Network Routing Problems	Troubleshoot VPC & subnet routing	
🖼 Lab Walkthrough (Screenshots)
1️⃣ Login Screens










2️⃣ Dashboard Screens








3️⃣ Error Logs








4️⃣ API Responses








📁 Project Structure
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

Multi-tier AWS deployment & infrastructure-as-code

Troubleshooting EC2, RDS, IAM, ELB, networking

Monitoring & automated alert pipelines

Incident response documentation & playbooks

Python scripting & CI/CD automation

📬 Contact

GitHub: charles-bucher

Portfolio: charles-bucher.github.io

LinkedIn: charles-bucher-cloud

Email: quietopscb@gmail.com

⚖️ License

MIT License

📝 About

AWS CloudOps lab: deploy, monitor, and troubleshoot multi-tier web apps using EC2, VPC, ELB, Terraform & CloudFormation. Focused on incident response, operational excellence, and real-world troubleshooting skills.

