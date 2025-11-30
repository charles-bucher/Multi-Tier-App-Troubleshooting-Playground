# Update-And-Push-Final-README.ps1
# Clean README with badges and 5 key screenshots

$readmeContent = @'
# Multi-Tier App Troubleshooting Playground 🛠️

![AWS](https://img.shields.io/badge/AWS-EC2%20%7C%20RDS%20%7C%20VPC-orange?logo=amazon-aws)
![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform)
![CloudWatch](https://img.shields.io/badge/Monitoring-CloudWatch-FF9900?logo=amazon-aws)
![Python](https://img.shields.io/badge/Automation-Python-3776AB?logo=python&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 👋 About This Project

Hands-on AWS lab simulating real-world CloudOps troubleshooting scenarios. Built to practice deploying, monitoring, and fixing multi-tier web applications in a controlled environment before touching production systems.

**What this demonstrates:**
- Deploying multi-tier AWS infrastructure (web, app, database layers)
- Simulating realistic operational failures and troubleshooting them
- Building monitoring pipelines and automated alerts
- Documenting incident response workflows

This isn't production infrastructure—it's a safe training ground for building CloudOps muscle memory.

---

## 🏗️ Architecture

![Architecture Diagram](diagrams/Multi-Tier_Diagram.png)

**Components:**
- **Frontend:** EC2 instances serving web tier
- **Backend:** EC2 instances running application logic
- **Database:** RDS instance for data persistence
- **Networking:** VPC with public/private subnets, security groups, routing tables
- **Load Balancing:** ELB distributing traffic across frontend instances
- **Monitoring:** CloudWatch dashboards, alarms, and logs

![Detailed Architecture](diagrams/Multi-Tier_diagram_2.png)

---

## 🚀 Quick Start

### 1. Deploy Infrastructure

```bash
terraform init
terraform plan
terraform apply
```

**Result:** Full multi-tier environment deployed (EC2, RDS, VPC, subnets, load balancer)

### 2. Verify Connectivity

- Test EC2 SSH access and security group rules
- Confirm routing table configurations
- Validate IAM role permissions

**Result:** Baseline operational state confirmed

### 3. Launch Application

- Start frontend services on web tier EC2 instances
- Start backend services on app tier EC2 instances
- Verify database connectivity from app tier

**Result:** Working multi-tier application

### 4. Run Troubleshooting Scenarios

Simulated failures include:
- **EC2 instance failure:** Instance stops responding, diagnose and recover
- **IAM permission errors:** App can't access RDS due to misconfigured roles
- **Database connection failures:** RDS security groups blocking app tier access
- **Load balancer health check failures:** ELB marking instances unhealthy
- **Network routing issues:** Subnet routing tables misconfigured

Each scenario includes problem description, symptoms, troubleshooting steps, root cause analysis, and resolution documentation.

**Result:** Hands-on experience diagnosing and fixing real-world AWS issues

### 5. Monitoring & Automation

- CloudWatch dashboards tracking key metrics
- Automated alerts via SNS for threshold breaches
- CI/CD workflows for infrastructure deployment
- Python scripts for health checks and validation

**Result:** Operational observability and automation practice

---

## 💻 Skills Demonstrated

| Area | Tools & Technologies |
|------|---------------------|
| **Cloud Infrastructure** | AWS EC2, VPC, ELB, RDS, IAM, S3 |
| **Infrastructure as Code** | Terraform, CloudFormation |
| **Monitoring & Logging** | CloudWatch (dashboards, alarms, logs, metrics) |
| **Automation** | Python scripting, Lambda functions, SNS alerts |
| **Troubleshooting** | Incident simulation, root cause analysis, documentation |
| **DevOps** | CI/CD workflows, GitHub Actions |

---

## 📸 Lab Walkthrough

**Authentication & Access Control**  
![Login Interface](screenshots/Multi_01_Login.png)

**Operational Monitoring Dashboard**  
![Dashboard Overview](screenshots/Multi_02_Dashboard.png)

**Error Log Analysis & Debugging**  
![Error Logs](screenshots/Multi_03_ErrorLogs.png)

**API Response Testing & Validation**  
![API Testing](screenshots/Multi_05_APIResponse.png)

**System Architecture Documentation**  
![Architecture](screenshots/Multi_14_Architecture.png)

---

## 🎯 Learning Outcomes

- Deploy and configure multi-tier AWS applications
- Troubleshoot operational failures (networking, IAM, database connectivity)
- Build monitoring dashboards and configure automated alerts
- Document incident response procedures
- Practice systematic problem-solving under simulated pressure

---

## 📂 Project Structure

```
Multi-Tier-App-Troubleshooting-Playground/
├── backend/          # Application tier code and configs
├── frontend/         # Web tier code and configs
├── database/         # Database initialization scripts
├── diagrams/         # Architecture diagrams
├── docs/             # Troubleshooting scenarios and playbooks
├── screenshots/      # Lab walkthrough screenshots
├── workflows/        # CI/CD automation
├── main.tf           # Terraform infrastructure deployment
├── outputs.tf        # Terraform outputs
└── variables.tf      # Terraform configuration variables
```

---

## 📬 Contact

**GitHub:** [charles-bucher](https://github.com/charles-bucher)  
**Portfolio:** [charles-bucher.github.io](https://charles-bucher.github.io)  
**LinkedIn:** [linkedin.com/in/charles-bucher-cloud](https://linkedin.com/in/charles-bucher-cloud)  
**Email:** quietopscb@gmail.com

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details
'@

Write-Host "Updating README with badges and streamlined screenshots..." -ForegroundColor Cyan
Set-Content -Path "README.md" -Value $readmeContent -Encoding UTF8

Write-Host "Deleting extra screenshots..." -ForegroundColor Cyan
$screenshotsToDelete = @(
    "screenshots/Multi_06_Login.png",
    "screenshots/Multi_07_Dashboard.png",
    "screenshots/Multi_08_ErrorLogs.png",
    "screenshots/Multi_10_APIResponse.png",
    "screenshots/Multi_11_Login.png",
    "screenshots/Multi_12_Dashboard.png",
    "screenshots/Multi_13_ErrorLogs.png",
    "screenshots/Multi_15_APIResponse.png",
    "screenshots/Multi_16_Login.png",
    "screenshots/Multi_17_Dashboard.png",
    "screenshots/Multi_18_ErrorLogs.png",
    "screenshots/Multi_20_APIResponse.png",
    "screenshots/Multi_21_Login.png"
)

foreach ($file in $screenshotsToDelete) {
    if (Test-Path $file) {
        Remove-Item $file
        Write-Host "  Deleted $file" -ForegroundColor Yellow
    }
}

Write-Host "Staging all changes..." -ForegroundColor Cyan
git add .

Write-Host "Committing..." -ForegroundColor Cyan
git commit -m "Clean README: add badges, streamline to 5 key screenshots"

Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push origin main

Write-Host "`nDone! Your repo now has:" -ForegroundColor Green
Write-Host "  ✓ Professional badges" -ForegroundColor Green
Write-Host "  ✓ 2 architecture diagrams" -ForegroundColor Green
Write-Host "  ✓ 5 workflow screenshots" -ForegroundColor Green
Write-Host "  ✓ Clean, scannable README" -ForegroundColor Green
Write-Host "`nCheck it out: https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground" -ForegroundColor Cyan