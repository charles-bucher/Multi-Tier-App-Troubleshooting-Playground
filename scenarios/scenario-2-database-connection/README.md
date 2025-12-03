# Scenario 2: Database Connection Issues

## Symptoms
- Application logs show database connection timeouts
- Web servers cannot reach RDS instance
- Application returns 500 errors

## Objective
Fix the networking configuration preventing database connectivity.

## Deploy This Scenario

```bash
cd scenarios/scenario-2-database-connection
terraform init
terraform apply
```

## Troubleshooting Steps

1. Check RDS security group inbound rules
2. Verify subnet routing for private subnets
3. Test database connectivity from EC2 instance
4. Check RDS instance status

## Commands to Help

```bash
# SSH to web instance
ssh -i your-key.pem ec2-user@<instance-ip>

# Test database connectivity
mysql -h <rds-endpoint> -u admin -p

# Check security groups
aws ec2 describe-security-groups --group-ids <sg-id>
```

## Solution

<details>
<summary>Click to reveal solution</summary>

The database security group is not allowing inbound traffic on port 3306 from the web server security group.

**Fix:**
Update the database security group to allow ingress from web server SG on port 3306.
</details>
