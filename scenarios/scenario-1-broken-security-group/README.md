# Scenario 1: Broken Security Group

## Symptoms
- Load balancer returns 502/504 errors
- Health checks failing
- Cannot access application through ALB

## Objective
Identify and fix the security group misconfiguration preventing traffic flow.

## Deploy This Scenario

```bash
cd scenarios/scenario-1-broken-security-group
terraform init
terraform apply
```

## Troubleshooting Steps

1. Check load balancer target health
2. Verify security group rules
3. Test connectivity from ALB to targets
4. Check network ACLs

## Hints

<details>
<summary>Hint 1</summary>
Check the ingress rules on the web server security group.
</details>

<details>
<summary>Hint 2</summary>
Does the security group allow traffic from the load balancer?
</details>

## Solution

<details>
<summary>Click to reveal solution</summary>

The web server security group is missing ingress rules to allow traffic from the ALB security group on port 80.

**Fix via AWS CLI:**
```bash
aws ec2 authorize-security-group-ingress \
  --group-id <web-sg-id> \
  --protocol tcp \
  --port 80 \
  --source-group <alb-sg-id>
```

**Or update the Terraform:**
Add this ingress rule to the web security group:
```hcl
ingress {
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  security_groups = [aws_security_group.alb.id]
}
```
</details>

## Cleanup

```bash
terraform destroy
```
