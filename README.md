# Multi-Tier App Troubleshooting Playground

**Hands-On Cloud Operations & Troubleshooting Lab**

---

## Overview

This repository is a hands-on playground for multi-tier application troubleshooting in cloud environments. It simulates real-world operational scenarios across compute, networking, and database layers, focusing on monitoring, incident response, automation, and recovery.

> **Note:** All environments were built, tested, documented with screenshots and GIFs, and then safely torn down.

---

## Key Features

- **Multi-Tier Architecture:** Frontend, backend, and database layers deployed via Terraform.
- **Cloud Monitoring & Alerts:** CloudWatch metrics, alarms, and logs capture operational data.
- **Automation & IaC:** Terraform scripts automate deployment and teardown.
- **Incident Response Scenarios:** Simulated failures with screenshots, metrics, and logs.
- **Rollback & Recovery:** Demonstrates restoring services after misconfigurations or failures.

---

## Lab Scenarios

### 1. EC2 Instance Failure & Recovery
- **Problem:** Backend EC2 instance stopped responding.
- **Detection:** CloudWatch alarm triggered due to high CPU utilization.
- **Action:** Recreated instance and validated connectivity.
- **Outcome:** Service restored; incident documented.

**Metrics Dashboard:**  
![EC2 Metrics Screenshot](screenshots/ec2-metrics.png)

**Recovery Process GIF:**  
![EC2 Recovery GIF](screenshots/ec2-recovery.gif)

---

### 2. Load Balancer Misconfiguration
- **Problem:** Intermittent web request failures.
- **Detection:** ELB logs highlighted routing errors.
- **Action:** Applied Terraform rollback to previous stable configuration.
- **Outcome:** Requests successfully routed; downtime minimized.

**ELB Logs Screenshot:**  
![ELB Routing Screenshot](screenshots/elb-routing.png)

**Traffic Before/After Chart:**  
![Traffic Chart](screenshots/elb-traffic.png)

---

### 3. Database Connection Issue
- **Problem:** Backend unable to connect to RDS.
- **Detection:** CloudWatch and application logs captured connection timeouts.
- **Action:** Adjusted security groups and restarted services.
- **Outcome:** Connection restored; incident documented for future reference.

**Database Logs Screenshot:**  
![Database Logs](screenshots/db-logs.png)

**Connection Recovery Metrics:**  
![DB Recovery Metrics](screenshots/db-metrics.png)

---

## Tools & Technologies

- **AWS Services:** EC2, RDS, VPC, ELB, CloudWatch, Lambda, IAM  
- **Automation & IaC:** Terraform, Python scripting  
- **Monitoring & Logging:** CloudWatch metrics, alarms, logs, dashboards  
- **Operational Practices:** Version-controlled infrastructure, rollback procedures, incident documentation  

---

## About the Author

I focus on **hands-on cloud support and operations**. This repository demonstrates my process of building, testing, documenting, and safely tearing down cloud environments. My goal is to develop operational expertise in troubleshooting, monitoring, and automating multi-tier applications.

---

## How to Explore

1. Clone the repository:
```bash
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
Browse lab folders: frontend/, backend/, database/ to explore Terraform scripts, Python automation, and logs.

Check the screenshots/ folder for visual documentation of incidents and recovery.

Deploy scripts in your own AWS account to explore safely, knowing all environments can be torn down.

Visual Highlights
CloudWatch Metrics Dashboard:

Lambda Automated Recovery Flow:

ELB Routing & Rollback:

Learnings & Takeaways
Proactive monitoring prevents escalation of failures.

Infrastructure as Code enables safe deployment and teardown.

Logs and metrics are essential for root cause analysis.

Automation reduces human error and accelerates incident resolution.

Simulated failures strengthen operational problem-solving skills.

yaml
Copy code

---

### ✅ How this README works
1. **Screenshots & GIFs inline:** Makes your repo interactive for recruiters/employers.  
2. **Before/After metrics placeholders:** Shows measurable results from recovery actions.  
3. **Honest description:** Clearly states the environments were built, tested, documented, and torn down.  
4. **Keywords for cloud support roles:** CloudWatch, Terraform, rollback, incident response, monitoring, automation.  
5. **Polished visual flow:** Organized scenario-based storytelling that demonstrates operational skill.

-