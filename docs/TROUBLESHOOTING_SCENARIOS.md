# Real-World Troubleshooting Scenarios

This document demonstrates my systematic approach to diagnosing and resolving common cloud infrastructure issues.

## Quick Reference

| # | Issue | Root Cause | Time | Skills |
|---|-------|------------|------|--------|
| 1 | Website unreachable | Security group missing HTTP rule | 8min | EC2, Security Groups |
| 2 | SSH connection fails | Key file permissions | 3min | SSH, Linux permissions |
| 3 | Backend timeout | Missing security group rule | 12min | Multi-tier networking |
| 4 | High CPU usage | Application infinite loop | 15min | CloudWatch, debugging |
| 5 | S3 access denied | No IAM role on EC2 | 10min | IAM roles and policies |

---

## Scenario 1: Website Connection Timeout

### Problem
Customer reports: "My website won't load - connection timeout error"

### Investigation Steps
1. Verify instance is running
2. Check security group inbound rules
3. Test connectivity
4. Review application logs

### Root Cause
Security group only had SSH (port 22). Missing HTTP (port 80) inbound rule.

### Resolution
Added HTTP inbound rule to security group.

**Time: 8 minutes**

---

## Scenario 2: SSH Permission Denied

### Problem
Customer cannot SSH: "Permission denied (publickey)"

### Root Cause
Windows .pem file had incorrect permissions.

### Resolution
Fixed file permissions using icacls.

**Time: 3 minutes**

---

## Scenario 3: Frontend Can't Reach Backend

### Problem
Application showing "Backend Service Unavailable"

### Root Cause
Backend security group didn't allow frontend SG on port 8080.

### Resolution
Added security group rule allowing frontend → backend.

**Time: 12 minutes**

---

## Scenario 4: High CPU Alert

### Problem
CloudWatch: 98% CPU for 15 minutes

### Root Cause
Application bug - infinite loop processing same record.

### Resolution
Restarted app immediately, then deployed code fix.

**Time: 15 minutes**

---

## Scenario 5: S3 Access Denied

### Problem
Backend can't read from S3: "Access Denied"

### Root Cause
EC2 instance had NO IAM role attached.

### Resolution
Created and attached IAM role with S3 permissions.

**Time: 10 minutes**

---

## Skills Demonstrated

### Technical
- EC2 troubleshooting
- Security groups
- IAM roles/policies
- Multi-tier networking
- CloudWatch monitoring
- AWS CLI (PowerShell)

### Support
- Systematic troubleshooting
- Quick triage (avg 9.6 min)
- Customer communication
- Root cause analysis
- Documentation

**Average Resolution Time: 9.6 minutes**
