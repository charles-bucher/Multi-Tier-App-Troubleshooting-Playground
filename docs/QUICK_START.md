# Quick Start Guide

## Prerequisites

- AWS Account
- AWS CLI configured
- Terraform installed
- SSH key pair in AWS

## Step 1: Clone Repository

`powershell
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
cd Multi-Tier-App-Troubleshooting-Playground
`

## Step 2: Deploy

`powershell
# Initialize
terraform init

# Deploy (5 minutes)
terraform apply -auto-approve
`

## Step 3: Get Instance IPs

`powershell
terraform output
`

## Step 4: Test

`powershell
# Test frontend
curl http://FRONTEND_IP

# SSH to instances
ssh -i your-key.pem ec2-user@FRONTEND_IP
`

## Step 5: Cleanup

`powershell
terraform destroy -auto-approve
`

## Troubleshooting

**Can't connect?**
- Check security groups
- Verify instance is running
- Confirm correct key file

**Backend timeout?**
- Check backend SG allows frontend
- Verify backend app is running

See docs/TROUBLESHOOTING_SCENARIOS.md for detailed examples.
