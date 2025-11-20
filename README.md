 🌟 Multi-Tier App Troubleshooting Playground 🛠️

---

## 📝 Overview

This repo is a hands-on **Multi-Tier App troubleshooting playground** for AWS CloudOps, demonstrating:

- EC2 setup and SSH connections  
- IAM role creation and policies  
- Apache installation and service management  
- Backend and database directory structures  
- End-to-end step-by-step lab for troubleshooting  

This lab is perfect for practicing real-world troubleshooting, monitoring, and operational tasks in cloud environments.

---

## 📂 Folder Structure

Multi-Tier-App-Troubleshooting-Playground/
├─ backend/
├─ database/
├─ docker/
├─ scripts/
├─ screenshots/
└─ README.md

yaml
Copy code

---

## 📸 Step-by-Step Screenshots

Click an image to view full size:

| Step | Screenshot |
|------|------------|
| Step 1 | ![Multi_01_cloned](screenshots/Multi_01_cloned.png) |
| Step 2 | ![Multi_02_CLI_configured](screenshots/Multi_02_CLI_configured.png) |
| Step 3 | ![Multi_03_IAM_Role_Creation_Complete](screenshots/Multi_03_IAM_Role_Creation_Complete.png) |
| Step 4 | ![Multi_04_EC2_Instance_List](screenshots/Multi_04_EC2_Instance_List.png) |
| Step 5 | ![Multi_05_EC2_Instance_Details](screenshots/Multi_05_EC2_Instance_Details.png) |
| Step 6 | ![Multi_06_Security_Group_Rules](screenshots/Multi_06_Security_Group_Rules.png) |
| Step 7 | ![Multi_07_SSH_Key_Generated](screenshots/Multi_07_SSH_Key_Generated.png) |
| Step 8 | ![Multi_08_Frontend_Role](screenshots/Multi_08_-Frontend-Role.png) |
| Step 9 | ![Multi_09_Ec2_Running](screenshots/Multi_09_Ec2_Running.png) |
| Step 10 | ![Multi_10_Repo_Cloned](screenshots/Multi_10_Repo_Cloned.png) |
| Step 11 | ![Multi_14_Apache_Start_Enable](screenshots/Multi_14_Apache_Start_Enable.png) |
| Step 12 | ![Multi_15_Backend_Directory_Structure](screenshots/Multi_15_Backend_Directory_Structure.png) |
| Step 13 | ![Multi_16_Database_Directory_Structure](screenshots/Multi_16_Database_Directory_Structure.png) |
| Step 14 | ![Multi_Apache_installed](screenshots/Multi_Apache_installed.png) |
| Step 15 | ![Multi_Ec2_details](screenshots/Multi_Ec2_details.png) |
| Step 16 | ![Multi_iam_role](screenshots/Multi_iam_role.png) |
| Step 17 | ![Multi_screenshot](screenshots/Multi_screenshot.png) |
| Step 18 | ![Multi_ssh_confirm](screenshots/Multi_ssh_confirm.png) |
| Step 19 | ![Multi_ssh_success](screenshots/Multi_ssh_success.png) |
| Step 20 | ![Multi_system_info](screenshots/Multi_system_info.png) |

---

## ⚡ How to Use

```bash
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
cd Multi-Tier-App-Troubleshooting-Playground
# Open README.md to follow step-by-step screenshots
Here's a complete "Troubleshooting Scenarios" section you can add to your README. Copy and paste this right after your "How to Use" section:
markdown## 🔧 Troubleshooting Scenarios

This playground includes common real-world issues you'll encounter in production CloudOps environments. Each scenario demonstrates systematic troubleshooting from symptom to resolution.

### Scenario 1: EC2 Instance Running but SSH Connection Refused
**Symptom:**
```bash
ssh -i my-key.pem ec2-user@
# Connection timed out
```

**Investigation Steps:**
1. Verify instance state: `aws ec2 describe-instances --instance-ids <id>`
2. Check security group rules: `aws ec2 describe-security-groups --group-ids <sg-id>`
3. Confirm public IP assignment
4. Test network connectivity: `ping <public-ip>`

**Root Cause:** Security group missing inbound rule for port 22 from your IP address

**Solution:**
```bash
aws ec2 authorize-security-group-ingress \
  --group-id  \
  --protocol tcp \
  --port 22 \
  --cidr /32
```

**Prevention:** Always validate security group rules immediately after EC2 creation. Use least-privilege access (specific IP ranges, not 0.0.0.0/0).

---

### Scenario 2: Apache Installed but Web Server Not Responding
**Symptom:**
```bash
curl http://localhost
# curl: (7) Failed to connect to localhost port 80
```

**Investigation Steps:**
1. Check Apache service status: `sudo systemctl status httpd`
2. Verify Apache is listening: `sudo netstat -tlnp | grep :80`
3. Check system logs: `sudo journalctl -u httpd -n 50`
4. Test local connectivity: `curl -I http://127.0.0.1`

**Root Cause:** Apache service installed but not started/enabled

**Solution:**
```bash
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
```

**Prevention:** Always verify service status after installation. Use `systemctl enable` to ensure service survives reboots.

---

### Scenario 3: Backend Cannot Connect to Database Tier
**Symptom:**
Application logs show: `Connection refused: Unable to connect to database on port 3306`

**Investigation Steps:**
1. Verify database EC2 instance is running
2. Check security group allows port 3306 from backend tier
3. Test connectivity from backend: `telnet <db-private-ip> 3306`
4. Verify IAM role attached to backend instance
5. Check database service: `sudo systemctl status mariadb`

**Root Cause:** Security group for database tier doesn't allow inbound traffic on port 3306 from backend security group

**Solution:**
```bash
aws ec2 authorize-security-group-ingress \
  --group-id  \
  --protocol tcp \
  --port 3306 \
  --source-group 
```

**Prevention:** Document tier-to-tier connectivity requirements. Use security group references instead of IP ranges for internal communication.

---

### Scenario 4: IAM Role Permissions Denied
**Symptom:**
```bash
aws s3 ls s3://my-bucket
# An error occurred (AccessDenied): User is not authorized
```

**Investigation Steps:**
1. Verify IAM role is attached: `aws sts get-caller-identity`
2. Review role policies: `aws iam get-role --role-name <role-name>`
3. Check trust relationships
4. Test with AWS CLI: `aws s3 ls --debug`

**Root Cause:** IAM role missing required S3 permissions or not attached to EC2 instance

**Solution:**
```bash
# Attach role to instance
aws ec2 associate-iam-instance-profile \
  --instance-id  \
  --iam-instance-profile Name=

# Update role policy with required permissions
aws iam put-role-policy --role-name  --policy-name S3Access --policy-document file://policy.json
```

**Prevention:** Use IAM policy simulator to test permissions before deployment. Follow least-privilege principle.

---

### Scenario 5: High CPU Usage on Frontend Tier
**Symptom:**
CloudWatch alarm triggered: CPU utilization at 95% for 10+ minutes

**Investigation Steps:**
1. Check CloudWatch metrics: `aws cloudwatch get-metric-statistics`
2. SSH into instance and run: `top` or `htop`
3. Identify process: `ps aux --sort=-%cpu | head -10`
4. Check Apache access logs: `sudo tail -f /var/log/httpd/access_log`
5. Review error logs: `sudo tail -f /var/log/httpd/error_log`

**Root Cause:** Unexpected traffic spike or runaway process consuming resources

**Solution:**
```bash
# Immediate: Restart problematic service
sudo systemctl restart httpd

# Short-term: Add more capacity
aws autoscaling set-desired-capacity --auto-scaling-group-name  --desired-capacity 3

# Long-term: Configure auto-scaling based on CPU metrics
```

**Prevention:** Implement CloudWatch alarms, auto-scaling policies, and load testing before production deployment.

---

## 🎯 Key Troubleshooting Commands Reference
```bash
# System Health
uptime
df -h
free -m
top

# Network Diagnostics
netstat -tlnp
ss -tulpn
ping 
telnet  
curl -I 

# Service Management
sudo systemctl status 
sudo systemctl restart 
sudo journalctl -u  -n 50

# AWS CLI
aws ec2 describe-instances
aws ec2 describe-security-groups
aws logs tail /aws/ec2/ --follow

# Log Analysis
sudo tail -f /var/log/messages
sudo tail -f /var/log/httpd/error_log
sudo grep -i error /var/log/httpd/error_log
```

---

## 📚 What I Learned

**Technical Skills:**
- IAM role creation and policy management for least-privilege access
- Multi-tier architecture security group configuration
- Systematic troubleshooting methodology: symptom → investigation → root cause → solution
- Apache web server deployment, configuration, and debugging
- AWS CLI automation for infrastructure management

**Operational Insights:**
- Security groups are stateful - understanding inbound/outbound rules is critical
- Always verify service status after installation and configuration changes
- Documentation is essential - future-you (or your team) will thank you
- Testing connectivity between tiers early prevents cascading failures
- CloudWatch metrics and logs are your first stop when troubleshooting

**What I'd Do Differently:**
- Implement infrastructure as code (Terraform) from the start for repeatability
- Add automated health checks and monitoring before deployment
- Create runbooks for each common failure scenario
- Use parameter store for configuration management instead of hardcoded values

📬 Contact
You can reach me professionally here:

GitHub: charles-bucher

LinkedIn: charles-bucher-cloud

Email: Quietopscb@gmail.com

💻 About
Hands-on AWS CloudOps lab deploying multi-tier web applications using EC2, VPC, Load Balancers, and CloudFormation/Terraform. Designed for troubleshooting, monitoring, alerting, and incident response practice. Exercises include deploying, configuring, debugging, and monitoring cloud environments to simulate real-world operational issues.

🛠 Topics
automation cloudformation terraform load-balancer multitier aws-ec2-vpc-s3-lambda-cloudwatch-cloudops-devops

📄 License
This project is licensed under the MIT License.

yaml
Copy code

---
