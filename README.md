# Multi-Tier App Troubleshooting Playground

[![AWS](https://img.shields.io/badge/AWS-Cloud-orange)](https://aws.amazon.com)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4)](https://terraform.io)
[![CloudOps](https://img.shields.io/badge/CloudOps-Support-blue)](https://github.com/charles-bucher)

> **Learning lab demonstrating cloud support troubleshooting skills** through documented AWS architecture scenarios. Deploy on-demand for practice, tear down when done.

## ?? Purpose

This is a **hands-on learning environment** that demonstrates my cloud support capabilities through:

- ? **Real troubleshooting scenarios** with step-by-step solutions
- ? **Multi-tier architecture** design and implementation
- ? **Infrastructure as Code** for reproducible deployments
- ? **Security best practices** documentation
- ? **Systematic incident response** methodology

**Note:** This is a *learning lab*, not a live production system. Deploy when needed for practice/demonstration, then tear down to avoid costs.

**Target Roles:** Cloud Support Engineer, CloudOps, Technical Support (Cloud)

---
---

## ?? Documentation

- **[Troubleshooting Scenarios](docs/TROUBLESHOOTING_SCENARIOS.md)** - 5 real incident response examples
- **[Architecture Guide](docs/ARCHITECTURE.md)** - System design and network flow
- **[Quick Start](docs/QUICK_START.md)** - Deploy in 5 minutes
- **[Skills Summary](docs/SKILLS_SUMMARY.md)** - Complete skill inventory

---

## ?? Quick Start
```powershell
# Clone repo
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
cd Multi-Tier-App-Troubleshooting-Playground

# Deploy infrastructure
terraform init
terraform apply -auto-approve

# Get instance IPs
terraform output
```

**Deployment Time:** ~5 minutes  
**Cost:** ~\/month (Free Tier eligible)

Full instructions: [docs/QUICK_START.md](docs/QUICK_START.md)

---

## ??? Architecture
```
Internet
   |
   v
Frontend (Apache) :80
   |
   v
Backend (Node.js) :8080
   |
   v
Database (PostgreSQL) :5432
```

**3-tier design** with security groups isolating each layer.

Details: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)

---

## ?? Real Troubleshooting Scenarios

### Scenario 1: Website Down (8 min)
**Problem:** Connection timeout  
**Root Cause:** Security group missing HTTP rule  
**Resolution:** Added port 80 inbound rule

### Scenario 2: SSH Fails (3 min)
**Problem:** Permission denied  
**Root Cause:** Incorrect .pem file permissions  
**Resolution:** Fixed with icacls

### Scenario 3: Backend Timeout (12 min)
**Problem:** Frontend can't reach backend  
**Root Cause:** Missing security group rule  
**Resolution:** Added backend SG to allow frontend

### Scenario 4: High CPU (15 min)
**Problem:** 98% CPU usage  
**Root Cause:** Application infinite loop  
**Resolution:** Restarted app, deployed fix

### Scenario 5: S3 Access Denied (10 min)
**Problem:** Can't read S3 bucket  
**Root Cause:** No IAM role on EC2  
**Resolution:** Created and attached IAM role

**See all scenarios:** [docs/TROUBLESHOOTING_SCENARIOS.md](docs/TROUBLESHOOTING_SCENARIOS.md)

---

## ?? Skills Demonstrated

### Technical
- EC2 instance management
- Security group configuration
- IAM roles and policies
- Multi-tier networking
- CloudWatch monitoring
- Terraform IaC
- AWS CLI (PowerShell)

### Support
- Systematic troubleshooting
- Quick incident triage (avg 9.6 min)
- Customer communication
- Root cause analysis
- Documentation

**Full skills list:** [docs/SKILLS_SUMMARY.md](docs/SKILLS_SUMMARY.md)

---

## ?? Project Stats

| Metric | Value |
|--------|-------|
| Architecture Tiers | 3 (frontend, backend, database) |
| Troubleshooting Scenarios | 5 documented |
| Avg Resolution Time | 9.6 minutes |
| Deployment Time | 5 minutes |
| Monthly Cost | ~\ (Free Tier eligible) |
| Lines of Terraform | 500+ |

---

## ?? Learning Outcomes

After deploying this project, you'll understand:

- Multi-tier application architecture
- AWS security group dependencies
- IAM role management for EC2
- Systematic troubleshooting methodology
- Infrastructure as Code with Terraform
- CloudWatch monitoring and alerting
- Common cloud support scenarios

---

## ??? Repository Structure
```
Multi-Tier-App-Troubleshooting-Playground/
+-- docs/
¦   +-- TROUBLESHOOTING_SCENARIOS.md  # 5 real incidents
¦   +-- ARCHITECTURE.md               # System design
¦   +-- QUICK_START.md                # Setup guide
¦   +-- SKILLS_SUMMARY.md             # Skills inventory
+-- frontend/                         # Apache web server
+-- backend/                          # Application server
+-- database/                         # Database tier
+-- screenshots/                      # Visual documentation
+-- main.tf                          # Terraform configuration
+-- README.md                        # This file
```

---

## ?? Related Projects

- [aws_monitoring_observability](https://github.com/charles-bucher/aws_monitoring_observability) - CloudWatch monitoring
- [cloudOps-guardDuty-automation](https://github.com/charles-bucher/cloudOps-guardDuty-automation) - Security automation
- [cloud-support-troubleshooting-toolkit](https://github.com/charles-bucher/cloud-support-troubleshooting-toolkit) - Diagnostic tools

---

## ?? About

**Charles Bucher**  
Cloud Support Engineer (Seeking Remote Roles)

- ?? Portfolio: [charles-bucher.github.io](https://charles-bucher.github.io)
- ?? LinkedIn: [Charles Bucher](https://www.linkedin.com/in/charles-bucher)
- ?? Email: quietopscb@gmail.com

**Open to:** Cloud Support Engineer, CloudOps, Technical Support roles (remote)

---

## ?? License

MIT License - See [LICENSE](LICENSE) for details

---

<div align="center">

**? If this helped you learn cloud support skills, please star the repo!**

Built with ?? for cloud support portfolios

</div>


## Screenshots
- ![img](screenshots/01-img.png) $label$
- ![img](screenshots/02-img.png) $label$
- ![img](screenshots/03-img.png) $label$
- ![img](screenshots/04-img.png) $label$
- ![img](screenshots/05-img.png) $label$
- ![img](screenshots/06-img.png) $label$
- ![img](screenshots/07-img.png) $label$
- ![img](screenshots/08-img.png) $label$
- ![img](screenshots/09-img.png) $label$
- ![img](screenshots/10-img.png) $label$
- ![img](screenshots/11-img.png) $label$
- ![img](screenshots/12-img.png) $label$
- ![img](screenshots/13-img.png) $label$
- ![img](screenshots/14-img.png) $label$
- ![img](screenshots/15-img.png) $label$
- ![img](screenshots/16-img.png) $label$
- ![img](screenshots/17-img.png) $label$
- ![img](screenshots/18-img.png) $label$
- ![img](screenshots/19-img.png) $label$
- ![img](screenshots/20-img.png) $label$
- ![img](screenshots/21-img.png) $label$

