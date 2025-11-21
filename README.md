# 🔧 Multi-Tier Application Troubleshooting Playground

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![CloudFormation](https://img.shields.io/badge/CloudFormation-FF4F00?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Flask](https://img.shields.io/badge/flask-%23000.svg?style=for-the-badge&logo=flask&logoColor=white)

![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![CloudWatch](https://img.shields.io/badge/CloudWatch-FF4F00?style=for-the-badge&logo=amazon-cloudwatch&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)
![GitHub Stars](https://img.shields.io/github/stars/charles-bucher/Multi-Tier-App-Troubleshooting-Playground?style=social)
![Last Commit](https://img.shields.io/github/last-commit/charles-bucher/Multi-Tier-App-Troubleshooting-Playground)

![Skill Level](https://img.shields.io/badge/Level-Intermediate--Advanced-orange)
![Portfolio Project](https://img.shields.io/badge/Project%20Type-Portfolio-purple)
![DevOps](https://img.shields.io/badge/Focus-DevOps%20%2F%20CloudOps-blue)

A hands-on AWS lab for mastering real-world troubleshooting. Deploy a multi-tier web application, then intentionally break it and fix it. This isn't just about deployment—it's about becoming the CloudOps engineer who can diagnose production issues at 3 AM.

![Multi-Tier Architecture Overview](docs/screenshots/architecture-overview.png)

---

## 📋 Table of Contents

- [What Makes This Different](#-what-makes-this-different)
- [What You'll Build](#️-what-youll-build)
- [Skills You'll Demonstrate](#-skills-youll-demonstrate)
- [Architecture Overview](#️-architecture-overview)
- [Tech Stack](#️-tech-stack)
- [Prerequisites](#-prerequisites)
- [Quick Start Guide](#-quick-start-guide)
- [Visual Deployment Walkthrough](#-visual-deployment-walkthrough)
- [Troubleshooting Scenarios](#-troubleshooting-scenarios)
- [Monitoring & Alerting](#-monitoring--alerting)
- [Project Structure](#️-project-structure)
- [What I Learned](#-what-i-learned)
- [Real-World Applications](#-real-world-applications)
- [Cost Breakdown](#-cost-breakdown)
- [Contributing](#-contributing)

---

## 🎯 What Makes This Different

Most portfolio projects show you can deploy infrastructure. **This one proves you can fix it when it breaks.**

### The Problem

- 📚 Tutorials teach deployment but not debugging
- 💼 Interviews ask about troubleshooting, not just building
- 🚨 Production issues happen at the worst possible times
- 🎯 Companies need engineers who can diagnose AND fix problems

### The Solution

This playground intentionally includes:

- ❌ Broken configurations to diagnose
- 🔍 Missing security groups to identify
- 📊 Monitoring gaps to fill
- 🚨 Alert fatigue scenarios to optimize
- 🔐 Permission issues to resolve

**Bottom Line:** This project shows hiring managers you can handle real production incidents, not just follow deployment guides.

---

## 🏗️ What You'll Build

A complete 3-tier web application on AWS that simulates a real production environment:

### Application Architecture

```
Internet
    ↓
[Application Load Balancer]
    ↓
[Web Tier - EC2 Instances in Auto Scaling Group]
    ↓
[Application Tier - EC2 Instances]
    ↓
[Database Tier - RDS MySQL]
```

### Components Deployed

| Layer | Technology | Purpose | High Availability |
|-------|-----------|---------|-------------------|
| Load Balancer | AWS ALB | Distributes traffic across web servers | Multi-AZ |
| Web Tier | EC2 (Amazon Linux 2) | Serves frontend (Nginx) | Auto Scaling Group |
| App Tier | EC2 (Ubuntu) | Runs backend API (Python Flask) | 2+ instances |
| Database | RDS MySQL | Stores application data | Multi-AZ standby |
| Networking | VPC, Subnets, Route Tables | Isolates and connects tiers | Multi-AZ design |
| Security | Security Groups, NACLs | Controls traffic flow | Least privilege |
| Monitoring | CloudWatch, CloudWatch Logs | Observability and alerting | Real-time metrics |

![Component Diagram](docs/screenshots/component-diagram.png)

---

## 💼 Skills You'll Demonstrate

### CloudOps Engineering

✅ Multi-tier AWS architecture design  
✅ VPC networking and subnet configuration  
✅ Security group troubleshooting  
✅ Load balancer health check debugging  
✅ Auto Scaling Group configuration  
✅ RDS database connectivity issues  

### DevOps Practices

✅ Infrastructure as Code (Terraform + CloudFormation)  
✅ Version-controlled infrastructure  
✅ Automated deployment pipelines  
✅ Configuration management  
✅ Log aggregation and analysis  

### Incident Response

✅ Systematic troubleshooting methodology  
✅ CloudWatch Logs analysis  
✅ Performance bottleneck identification  
✅ Root cause analysis documentation  
✅ Runbook creation for common issues  

### Monitoring & Observability

✅ CloudWatch metrics and alarms  
✅ Application-level logging  
✅ Health check configuration  
✅ Alert fatigue reduction strategies  
✅ Dashboard creation for operations teams  

---

## 🏛️ Architecture Overview

### Network Topology

![Network Architecture](docs/screenshots/network-topology.png)

### High-Level Design

```
┌─────────────────────────────────────────────────────────────────┐
│                          AWS Cloud (VPC)                        │
│                                                                 │
│  ┌────────────────────────────────────────────────────────┐   │
│  │               Public Subnet (AZ-1)                     │   │
│  │  ┌─────────────────┐         ┌──────────────────┐    │   │
│  │  │  Web Server 1   │         │   NAT Gateway    │    │   │
│  │  │  (EC2 - Nginx)  │         │                  │    │   │
│  │  └─────────────────┘         └──────────────────┘    │   │
│  └────────────────────────────────────────────────────────┘   │
│                                                                 │
│  ┌────────────────────────────────────────────────────────┐   │
│  │              Private Subnet (AZ-1)                     │   │
│  │  ┌─────────────────┐         ┌──────────────────┐    │   │
│  │  │  App Server 1   │         │  RDS MySQL       │    │   │
│  │  │  (EC2 - Flask)  │────────▶│  (Primary)       │    │   │
│  │  └─────────────────┘         └──────────────────┘    │   │
│  └────────────────────────────────────────────────────────┘   │
│                                                                 │
│  ┌────────────────────────────────────────────────────────┐   │
│  │               Public Subnet (AZ-2)                     │   │
│  │  ┌─────────────────┐                                  │   │
│  │  │  Web Server 2   │         [Application Load       │   │
│  │  │  (EC2 - Nginx)  │◀────────  Balancer]             │   │
│  │  └─────────────────┘                                  │   │
│  └────────────────────────────────────────────────────────┘   │
│                                                                 │
│  ┌────────────────────────────────────────────────────────┐   │
│  │              Private Subnet (AZ-2)                     │   │
│  │  ┌─────────────────┐         ┌──────────────────┐    │   │
│  │  │  App Server 2   │         │  RDS MySQL       │    │   │
│  │  │  (EC2 - Flask)  │────────▶│  (Standby)       │    │   │
│  │  └─────────────────┘         └──────────────────┘    │   │
│  └────────────────────────────────────────────────────────┘   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
                              ▲
                              │
                      Internet Gateway
                              │
                         [Users]
```

### Traffic Flow

1. **User Request** → Internet Gateway → ALB
2. **ALB** → Health Check → Web Tier (EC2)
3. **Web Tier** → Internal call → App Tier (EC2)
4. **App Tier** → Database query → RDS MySQL
5. **Response** → Reverse path back to user

---

## 🛠️ Tech Stack

| Category | Technology | Why It's Used |
|----------|-----------|---------------|
| **Infrastructure** | Terraform | Declarative IaC for reproducible deployments |
| **Alternative IaC** | CloudFormation | Native AWS IaC for comparison |
| **Compute** | EC2 (t2.micro) | Cost-effective servers for web/app tiers |
| **Load Balancing** | Application Load Balancer | Layer 7 load balancing with health checks |
| **Database** | RDS MySQL (db.t3.micro) | Managed relational database |
| **Networking** | VPC, Subnets, IGW, NAT | Secure, isolated network architecture |
| **Security** | Security Groups, IAM | Least-privilege access control |
| **Monitoring** | CloudWatch, CloudWatch Logs | Centralized logging and metrics |
| **Auto Scaling** | Auto Scaling Groups | Dynamic capacity based on demand |
| **Web Server** | Nginx | High-performance reverse proxy |
| **Application** | Python Flask | Lightweight web framework |
| **Version Control** | Git | Infrastructure change tracking |

---

## 📦 Prerequisites

### Required

- ✅ **AWS Account** with administrative access
- ✅ **AWS CLI** installed and configured ([Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html))
- ✅ **Terraform v1.0+** ([Download](https://www.terraform.io/downloads.html))
- ✅ **Git** for version control
- ✅ **SSH Key Pair** in your AWS account for EC2 access

### Recommended Knowledge

- Basic Linux administration (SSH, file permissions, systemd)
- Networking fundamentals (CIDR, routing, ports)
- AWS Console familiarity (EC2, VPC, RDS dashboards)
- Understanding of HTTP/HTTPS (status codes, headers)

### ⚠️ Cost Warning

This lab uses paid AWS services. **Estimated cost: $20-50/month** if left running continuously. Always destroy resources after practice sessions.

---

## 🚀 Quick Start Guide

### Step 1: Clone the Repository

```bash
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
cd Multi-Tier-App-Troubleshooting-Playground
```

![Git Clone](docs/screenshots/01-git-clone.png)

### Step 2: Configure AWS Credentials

```bash
aws configure
# Enter your AWS Access Key ID
# Enter your AWS Secret Access Key
# Default region: us-east-1
# Default output format: json
```

![AWS Configure](docs/screenshots/02-aws-configure.png)

### Step 3: Deploy with Terraform

```bash
cd terraform/

# Initialize Terraform
terraform init

# Review the deployment plan
terraform plan

# Deploy infrastructure (takes 10-15 minutes)
terraform apply -auto-approve
```

![Terraform Init](docs/screenshots/03-terraform-init.png)

### Step 4: Verify Deployment

```bash
# Get Load Balancer URL from Terraform output
terraform output alb_dns_name

# Example output:
# http://my-alb-123456789.us-east-1.elb.amazonaws.com
```

![Terraform Output](docs/screenshots/04-terraform-output.png)

### Step 5: Test the Application

```bash
# Test via curl
curl http://YOUR_ALB_DNS_NAME

# Or open in browser
```

![Application Working](docs/screenshots/05-app-working.png)

---

## 🎬 Visual Deployment Walkthrough

### Terraform Initialization

![Terraform downloading providers and initializing backend](docs/screenshots/terraform-init-process.gif)

### Infrastructure Deployment

![Real-time infrastructure creation across AWS](docs/screenshots/terraform-apply-progress.gif)

### Load Balancer Health Checks

![Watching instances become healthy in the target group](docs/screenshots/alb-health-checks.gif)

### Application Response

![Testing the deployed application endpoints](docs/screenshots/app-response.gif)

### CloudWatch Metrics

![Real-time monitoring of application performance](docs/screenshots/cloudwatch-metrics.gif)

---

## 🔥 Troubleshooting Scenarios

This playground includes intentional issues to practice real-world debugging skills.

### Scenario 1: Web Server Can't Reach App Tier

**Symptom:** ALB returns 502 Bad Gateway

![502 Error](docs/screenshots/scenario-01-502-error.png)

**Root Cause:** Security group missing inbound rule from web tier to app tier

**Fix:**

```bash
# Check security group rules
aws ec2 describe-security-groups --group-ids sg-xxxxx

# Add missing rule
aws ec2 authorize-security-group-ingress \
  --group-id sg-app-tier \
  --protocol tcp \
  --port 5000 \
  --source-group sg-web-tier
```

![Security Group Fix](docs/screenshots/scenario-01-fix.png)

**Learning:** Always verify security group rules allow traffic between tiers

---

### Scenario 2: Database Connection Timeout

**Symptom:** Application logs show "Can't connect to MySQL server"

![DB Connection Error](docs/screenshots/scenario-02-db-error.png)

**Root Cause:** App tier security group doesn't allow egress to RDS port 3306

**Debugging Steps:**

```bash
# SSH into app server
ssh -i key.pem ec2-user@app-server-ip

# Test database connectivity
nc -zv your-rds-endpoint.rds.amazonaws.com 3306

# Check application logs
tail -f /var/log/flask/app.log
```

![Database Debugging](docs/screenshots/scenario-02-debugging.png)

**Fix:** Update security groups to allow MySQL traffic

**Learning:** Network connectivity issues often manifest as application errors

---

### Scenario 3: Auto Scaling Not Triggering

**Symptom:** Load increases but no new instances launch

![Auto Scaling Issue](docs/screenshots/scenario-03-asg-issue.png)

**Root Cause:** CloudWatch alarm threshold set too high

**Investigation:**

```bash
# Check Auto Scaling activity
aws autoscaling describe-scaling-activities \
  --auto-scaling-group-name web-tier-asg

# Review CloudWatch alarms
aws cloudwatch describe-alarms \
  --alarm-names web-tier-cpu-high
```

![CloudWatch Alarms](docs/screenshots/scenario-03-alarms.png)

**Fix:** Adjust alarm threshold from 80% to 60% CPU

**Learning:** Auto Scaling depends on properly configured CloudWatch metrics

---

### Scenario 4: Unhealthy Target in Load Balancer

**Symptom:** Some requests succeed, others fail intermittently

![Unhealthy Target](docs/screenshots/scenario-04-unhealthy-target.png)

**Root Cause:** Health check path misconfigured or application not responding

**Diagnosis:**

```bash
# Check target health
aws elbv2 describe-target-health \
  --target-group-arn arn:aws:elasticloadbalancing:...

# SSH to unhealthy instance and check nginx
ssh -i key.pem ec2-user@instance-ip
sudo systemctl status nginx
curl localhost
```

![Health Check Debugging](docs/screenshots/scenario-04-debugging.png)

**Fix Options:**

- Restart web server: `sudo systemctl restart nginx`
- Update health check path in ALB settings
- Review application logs for errors

**Learning:** Load balancers rely on accurate health checks

---

### Scenario 5: High CloudWatch Costs

**Symptom:** Monthly AWS bill shows unexpected CloudWatch charges

![CloudWatch Costs](docs/screenshots/scenario-05-costs.png)

**Root Cause:** Excessive custom metrics or log retention

**Investigation:**

```bash
# List all custom metrics
aws cloudwatch list-metrics --namespace Custom

# Check log group retention
aws logs describe-log-groups
```

**Optimization:**

- Reduce metric resolution from 1 minute to 5 minutes
- Set log retention to 7 days instead of indefinite
- Aggregate similar metrics
- Use metric filters instead of custom metrics

![Cost Optimization](docs/screenshots/scenario-05-optimization.png)

**Learning:** Monitoring costs can escalate; optimize metric collection

---

## 📊 Monitoring & Alerting

### CloudWatch Dashboard

![CloudWatch Dashboard](docs/screenshots/cloudwatch-dashboard.png)

### Key Metrics Tracked

| Metric | Threshold | Alert Action |
|--------|-----------|--------------|
| ALB 5XX Errors | > 5 in 5 minutes | Email + Slack notification |
| EC2 CPU Usage | > 70% for 10 minutes | Trigger Auto Scaling |
| RDS Connections | > 80% of max | Scale up instance |
| Disk Usage | > 85% | Alert ops team |
| Health Check Failures | > 2 consecutive | Remove from rotation |

### Sample CloudWatch Alarm

```hcl
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "web-tier-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "Triggers when CPU exceeds 70%"
  alarm_actions       = [aws_sns_topic.alerts.arn]
}
```

![Alarm Configuration](docs/screenshots/alarm-config.png)

---

## 🗂️ Project Structure

```
Multi-Tier-App-Troubleshooting-Playground/
│
├── docs/
│   ├── screenshots/                   # All visual documentation
│   │   ├── architecture-overview.png
│   │   ├── network-topology.png
│   │   ├── 01-git-clone.png
│   │   ├── 02-aws-configure.png
│   │   ├── 03-terraform-init.png
│   │   ├── 04-terraform-output.png
│   │   ├── 05-app-working.png
│   │   ├── terraform-init-process.gif
│   │   ├── terraform-apply-progress.gif
│   │   ├── alb-health-checks.gif
│   │   ├── app-response.gif
│   │   ├── cloudwatch-metrics.gif
│   │   ├── scenario-01-502-error.png
│   │   ├── scenario-01-fix.png
│   │   ├── scenario-02-db-error.png
│   │   ├── scenario-02-debugging.png
│   │   ├── scenario-03-asg-issue.png
│   │   ├── scenario-03-alarms.png
│   │   ├── scenario-04-unhealthy-target.png
│   │   ├── scenario-04-debugging.png
│   │   ├── scenario-05-costs.png
│   │   ├── scenario-05-optimization.png
│   │   ├── cloudwatch-dashboard.png
│   │   └── alarm-config.png
│   │
│   ├── runbooks/                      # Troubleshooting guides
│   │   ├── 502-bad-gateway.md
│   │   ├── database-connectivity.md
│   │   ├── auto-scaling-issues.md
│   │   └── health-check-failures.md
│   │
│   └── architecture-diagrams/         # Draw.io source files
│       ├── network-diagram.drawio
│       └── traffic-flow.drawio
│
├── terraform/
│   ├── main.tf                        # Core infrastructure
│   ├── vpc.tf                         # VPC and networking
│   ├── alb.tf                         # Load balancer config
│   ├── ec2.tf                         # Web and app tier instances
│   ├── rds.tf                         # Database configuration
│   ├── security-groups.tf             # Security group rules
│   ├── auto-scaling.tf                # Auto Scaling Groups
│   ├── cloudwatch.tf                  # Monitoring and alarms
│   ├── variables.tf                   # Input variables
│   ├── outputs.tf                     # Output values
│   ├── terraform.tfvars.example       # Example variables
│   └── backend.tf                     # State backend config
│
├── cloudformation/
│   ├── full-stack.yaml                # Complete stack template
│   ├── networking.yaml                # VPC nested stack
│   ├── compute.yaml                   # EC2 nested stack
│   └── database.yaml                  # RDS nested stack
│
├── scripts/
│   ├── user-data-web.sh               # Web server bootstrap script
│   ├── user-data-app.sh               # App server bootstrap script
│   ├── deploy.sh                      # Deployment automation
│   ├── destroy.sh                     # Cleanup script
│   └── health-check.sh                # Application health checker
│
├── app/
│   ├── web/                           # Nginx configuration
│   │   ├── nginx.conf
│   │   └── index.html
│   │
│   └── api/                           # Flask application
│       ├── app.py
│       ├── requirements.txt
│       └── config.py
│
├── monitoring/
│   ├── cloudwatch-dashboard.json      # Custom dashboard
│   └── alarm-templates/               # Reusable alarm configs
│
├── .github/
│   └── workflows/
│       ├── terraform-validate.yml     # CI/CD validation
│       └── cost-estimation.yml        # Infracost integration
│
├── .gitignore
├── LICENSE
└── README.md                          # This file
```

---

## 📚 What I Learned

Building this troubleshooting playground taught me skills that matter in production environments:

### Technical Deep Dives

**VPC Networking**
- How subnet CIDR blocks affect scalability
- Why NAT Gateways are expensive but necessary for private subnets
- The difference between NACLs (stateless) and Security Groups (stateful)
- Route table priorities and how they affect traffic flow

**Load Balancer Configuration**
- Health check intervals impact detection time vs. cost
- Target group stickiness affects session management
- Connection draining prevents dropped requests during deployments
- Cross-zone load balancing improves availability but increases data transfer costs

**Auto Scaling Strategy**
- Cooldown periods prevent thrashing during load spikes
- Simple scaling vs. target tracking vs. step scaling policies
- Launch templates vs. launch configurations (templates are better)
- Mixing on-demand and spot instances for cost optimization

**Database Performance**
- Connection pooling prevents exhausting RDS connections
- Multi-AZ increases availability but adds latency
- Read replicas reduce primary database load
- Parameter groups allow MySQL tuning without server access

### Debugging Methodology

I developed a systematic approach to troubleshooting:

1. **Check the obvious first** - Is it turned on? Are credentials valid?
2. **Follow the traffic** - Trace requests from user to database
3. **Read the logs** - CloudWatch Logs reveal most issues
4. **Isolate the layer** - Is it network, application, or database?
5. **Document everything** - Future-me will thank present-me

### Real Challenges Overcome

**Challenge 1: Terraform State Conflicts**
- **Problem:** Multiple team members couldn't work simultaneously
- **Solution:** Implemented S3 backend with DynamoDB state locking
- **Learning:** Always use remote state for team projects

**Challenge 2: RDS Connection Exhaustion**
- **Problem:** Application crashed under load due to too many DB connections
- **Solution:** Implemented connection pooling in Flask application
- **Learning:** Default connection limits are often too low for production

**Challenge 3: Security Group Complexity**
- **Problem:** Hard to visualize which resources can talk to which
- **Solution:** Created security group documentation and diagrams
- **Learning:** Document networking decisions as you make them

**Challenge 4: CloudWatch Cost Spiral**
- **Problem:** Custom metrics and logs cost $200/month in testing
- **Solution:** Aggregated metrics and set 7-day log retention
- **Learning:** Monitoring costs can exceed compute costs if not managed

### Best Practices Discovered

- **Infrastructure as Code is non-negotiable** - Manual changes get forgotten
- **Tag everything** - Cost allocation reports require consistent tagging
- **Automate runbooks** - If you're SSH'ing to fix it, script it
- **Monitor from the user's perspective** - Synthetic monitoring catches issues before users do
- **Design for failure** - Assume everything will break eventually

---

## 🌍 Real-World Applications

This playground directly translates to production scenarios I'm ready to handle:

### Scenario: E-commerce Site During Black Friday

**Skills Applied:**
- Auto Scaling to handle 10x traffic surge
- CloudWatch alarms to detect and alert on errors
- Health checks to automatically remove failing instances
- Multi-AZ deployment for high availability

**My Contribution:** Design and deploy the infrastructure, then monitor during the event

### Scenario: SaaS Application Database Migration

**Skills Applied:**
- RDS snapshot and restore procedures
- Blue/green deployment for zero-downtime migration
- Connection string management across environments
- Rollback procedures if migration fails

**My Contribution:** Execute the migration and troubleshoot connectivity issues

### Scenario: Security Incident Response

**Skills Applied:**
- Security group analysis to identify unauthorized access
- CloudWatch Logs analysis to trace attacker behavior
- Isolation of compromised instances
- Forensic data collection before cleanup

**My Contribution:** Investigate the breach and implement preventive measures

---

## 💰 Cost Breakdown

Understanding AWS costs is critical for CloudOps engineers.

### Monthly Cost Estimate (Running 24/7)

| Service | Configuration | Monthly Cost |
|---------|--------------|--------------|
| EC2 (Web Tier) | 2x t2.micro | $16.00 |
| EC2 (App Tier) | 2x t2.micro | $16.00 |
| Application Load Balancer | 1x ALB | $22.50 |
| RDS MySQL | 1x db.t3.micro Multi-AZ | $30.00 |
| NAT Gateway | 1x NAT Gateway | $32.40 |
| Data Transfer | ~10GB outbound | $1.00 |
| CloudWatch | Metrics + Logs | $5.00 |
| **Total** | | **~$122.90/month** |

### Cost Optimization Tips

**Reduce Costs by 70%:**

1. **Destroy when not in use:** Run only during practice sessions (~$10/week)
2. **Use smaller instances:** t2.nano where possible ($4.75/month each)
3. **Single AZ for learning:** Disable Multi-AZ RDS ($15/month savings)
4. **Remove NAT Gateway:** Use bastion host instead ($32.40/month savings)
5. **Reduce CloudWatch metrics:** Collect only critical metrics ($3/month savings)

**Estimated Learning Cost:** $20-40/month with aggressive cleanup

---

## 🔮 Future Enhancements

This is a living project that I'm actively improving:

### Phase 1: Advanced Monitoring (Next 2 Weeks)
- [ ] Integrate AWS X-Ray for distributed tracing
- [ ] Add custom metrics from application code
- [ ] Create Grafana dashboards for better visualization
- [ ] Implement synthetic monitoring with CloudWatch Synthetics

### Phase 2: CI/CD Integration (Next Month)
- [ ] GitHub Actions pipeline for automatic deployment
- [ ] Automated testing with Terratest
- [ ] Blue/green deployment strategy
- [ ] Rollback automation on health check failure

### Phase 3: Security Hardening (Next 2 Months)
- [ ] Integrate AWS Secrets Manager for credentials
- [ ] Enable VPC Flow Logs for network monitoring
- [ ] Add AWS WAF to protect against common attacks
- [ ] Implement least-privilege IAM roles

### Phase 4: Cost Optimization (Next 3 Months)
- [ ] Implement spot instances in Auto Scaling Groups
- [ ] Add AWS Compute Optimizer recommendations
- [ ] Create cost anomaly detection alarms
- [ ] Implement S3 lifecycle policies for log archival

### Phase 5: Advanced Features (Next 6 Months)
- [ ] Multi-region deployment with Route 53 failover
- [ ] Container orchestration with ECS/EKS
- [ ] Serverless functions for event processing
- [ ] Machine learning for anomaly detection

---

## 🤝 Contributing

I'm building this in public and welcome contributions, suggestions, and feedback.

### How You Can Help

**Found a Bug?**
- Open an issue with reproduction steps
- Include error messages and screenshots
- Tag with `bug` label

**Have an Improvement Idea?**
- Open an issue describing your suggestion
- Explain the benefit and use case
- Tag with `enhancement` label

**Want to Add a Troubleshooting Scenario?**
1. Fork this repository
2. Create a new branch: `git checkout -b scenario/your-scenario-name`
3. Add documentation in `docs/runbooks/`
4. Include screenshots in `docs/screenshots/`
5. Update this README with your scenario
6. Submit a pull request

### Areas Where I'd Love Collaboration

- Additional troubleshooting scenarios from real production incidents
- CloudFormation alternative implementations
- Kubernetes/ECS versions of this architecture
- Monitoring dashboards and alert configurations
- Cost optimization techniques
- Security best practices

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file