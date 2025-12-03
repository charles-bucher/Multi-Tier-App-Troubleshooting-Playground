# Scenario 3: Load Balancer Health Check Failures

## Symptoms
- Targets showing as unhealthy in target group
- Load balancer not routing traffic
- CloudWatch alarms firing for unhealthy hosts

## Objective
Fix the health check configuration or application issues causing failures.

## Deploy This Scenario

```bash
cd scenarios/scenario-3-load-balancer-health
terraform init
terraform apply
```

## Troubleshooting Steps

1. Review target group health check settings
2. Check application logs on EC2 instances
3. Verify the health check endpoint exists
4. Test health check path manually

## Commands

```bash
# Check target health
aws elbv2 describe-target-health --target-group-arn <tg-arn>

# Test health check endpoint
curl http://<instance-ip>/health

# View application logs
ssh ec2-user@<instance-ip>
sudo journalctl -u app.service
```

## Solution

<details>
<summary>Click to reveal solution</summary>

The health check path is set to `/health` but the application doesn't have this endpoint configured, or the health check timeout is too short.

**Fix options:**
1. Update the application to respond to `/health`
2. Change target group health check path to `/`
3. Increase health check timeout values
</details>
