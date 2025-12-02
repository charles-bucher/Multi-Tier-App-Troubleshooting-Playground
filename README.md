Multi-Tier App Troubleshooting Playground 🛠️

Hands-on AWS lab for deploying, monitoring, and troubleshooting multi-tier web applications.
Focus: CloudOps, troubleshooting, infrastructure-as-code, and incident response.

🚀 Quick Overview
Feature	What You Learn	Screenshot
Multi-tier AWS deployment	Deploy Frontend → Backend → Database	

Operational failure simulation	Practice incident response & root cause analysis	

Monitoring dashboards & alerts	Build CloudWatch dashboards & automated alerts	

CI/CD automation	Deploy & update infrastructure with Terraform	
🏗 System Architecture

Primary Diagram:

Alternate / Detailed Diagram:

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
🖼 Lab Walkthrough (Screenshots & Diagrams)
<!-- SCREENSHOT-GALLERY-START -->








































<!-- SCREENSHOT-GALLERY-END -->
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


<!-- SCREENSHOT-GALLERY-START -->
[![Multi_01_Login.png](screenshots/thumb/Multi_01_Login.png)](screenshots/Multi_01_Login.png)
[![Multi_02_Dashboard.png](screenshots/thumb/Multi_02_Dashboard.png)](screenshots/Multi_02_Dashboard.png)
[![Multi_03_ErrorLogs.png](screenshots/thumb/Multi_03_ErrorLogs.png)](screenshots/Multi_03_ErrorLogs.png)
[![Multi_05_APIResponse.png](screenshots/thumb/Multi_05_APIResponse.png)](screenshots/Multi_05_APIResponse.png)
[![Multi_06_Login.png](screenshots/thumb/Multi_06_Login.png)](screenshots/Multi_06_Login.png)
[![Multi_07_Dashboard.png](screenshots/thumb/Multi_07_Dashboard.png)](screenshots/Multi_07_Dashboard.png)
[![Multi_08_ErrorLogs.png](screenshots/thumb/Multi_08_ErrorLogs.png)](screenshots/Multi_08_ErrorLogs.png)
[![Multi_10_APIResponse.png](screenshots/thumb/Multi_10_APIResponse.png)](screenshots/Multi_10_APIResponse.png)
[![Multi_11_Login.png](screenshots/thumb/Multi_11_Login.png)](screenshots/Multi_11_Login.png)
[![Multi_12_Dashboard.png](screenshots/thumb/Multi_12_Dashboard.png)](screenshots/Multi_12_Dashboard.png)
[![Multi_13_ErrorLogs.png](screenshots/thumb/Multi_13_ErrorLogs.png)](screenshots/Multi_13_ErrorLogs.png)
[![Multi_14_Architecture.png](screenshots/thumb/Multi_14_Architecture.png)](screenshots/Multi_14_Architecture.png)
[![Multi_15_APIResponse.png](screenshots/thumb/Multi_15_APIResponse.png)](screenshots/Multi_15_APIResponse.png)
[![Multi_16_Login.png](screenshots/thumb/Multi_16_Login.png)](screenshots/Multi_16_Login.png)
[![Multi_17_Dashboard.png](screenshots/thumb/Multi_17_Dashboard.png)](screenshots/Multi_17_Dashboard.png)
[![Multi_18_ErrorLogs.png](screenshots/thumb/Multi_18_ErrorLogs.png)](screenshots/Multi_18_ErrorLogs.png)
[![Multi_20_APIResponse.png](screenshots/thumb/Multi_20_APIResponse.png)](screenshots/Multi_20_APIResponse.png)
[![Multi_21_Login.png](screenshots/thumb/Multi_21_Login.png)](screenshots/Multi_21_Login.png)
<!-- SCREENSHOT-GALLERY-END -->
