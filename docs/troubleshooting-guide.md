# Troubleshooting Guide

## General Troubleshooting Process

1. **Identify the symptom**
2. **Check recent changes**
3. **Review logs and metrics**
4. **Isolate the problem layer**
5. **Test hypotheses**
6. **Implement fix**
7. **Verify resolution**

## Common Issues and Solutions

### Issue: Can't Access Application

**Possible Causes:**
- Security group misconfiguration
- Network ACL blocking traffic
- Instance not running
- Application not started

**Steps:**
```bash
# Check instance status
aws ec2 describe-instances --instance-ids <id>

# Check security groups
aws ec2 describe-security-groups --group-ids <sg-id>

# Test connectivity
telnet <instance-ip> 80
```

### Issue: Health Checks Failing

**Possible Causes:**
- Wrong health check path
- Application not responding
- Timeout too short
- Port misconfiguration

**Steps:**
```bash
# Check target health
aws elbv2 describe-target-health --target-group-arn <arn>

# Test health check manually
curl -v http://<instance-ip>:80/health
```

### Issue: Database Connection Errors

**Possible Causes:**
- Security group not allowing DB access
- Wrong connection string
- Database credentials incorrect
- Network routing issue

**Steps:**
```bash
# Test from web server
mysql -h <rds-endpoint> -u admin -p

# Check security group
aws rds describe-db-instances --db-instance-identifier <id>
```

## Useful AWS CLI Commands

```bash
# List all resources in region
aws resourcegroupstaggingapi get-resources

# Check CloudWatch logs
aws logs tail /aws/ec2/user-data --follow

# Describe VPC
aws ec2 describe-vpcs --vpc-ids <vpc-id>

# Check route tables
aws ec2 describe-route-tables --filters "Name=vpc-id,Values=<vpc-id>"
```

## Monitoring Checklist

- [ ] Check CloudWatch dashboard
- [ ] Review application logs
- [ ] Check system metrics (CPU, memory, disk)
- [ ] Verify network connectivity
- [ ] Review security group rules
- [ ] Check recent deployments/changes
