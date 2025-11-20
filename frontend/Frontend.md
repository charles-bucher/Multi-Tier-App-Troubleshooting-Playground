# Frontend Tier - IAM Setup

## IAM Role
- **Role Name:** MTAP-Frontend-Role
- **Attached Policies:**
  - AmazonS3ReadOnlyAccess
  - AmazonEC2ReadOnlyAccess (optional)
  - Custom policy for frontend API access

## Steps Taken
1. Created IAM role in AWS Console
2. Attached required policies
3. Assigned role to Frontend EC2 instance

## Verification Commands
```bash
ssh ec2-user@<frontend-ip>
aws s3 ls
