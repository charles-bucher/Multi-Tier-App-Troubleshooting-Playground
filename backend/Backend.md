# Backend Tier – IAM Configuration & Instance Access

The backend EC2 instance needs controlled access to S3, DynamoDB, and EC2 metadata so it can pull app data, run queries, and support troubleshooting. Below is the exact IAM setup used for this tier.

## IAM Role Overview
**Role Name:** `Multi-Tier`

This role contains only the permissions the backend actually needs:

- **AmazonS3ReadOnlyAccess** – lets the backend fetch configuration files or static assets stored in S3.
- **AmazonDynamoDBFullAccess** – allows full read/write access for the application’s database table.
- **AmazonEC2ReadOnlyAccess** – mainly useful for backend health checks and validating instance state during incidents.

## What Was Done
1. Created the IAM role (`Multi-Tier`) in the AWS Console.
2. Attached the three policies listed above.
3. Assigned the role directly to the backend EC2 instance so it can make API calls without storing credentials.

## Quick Verification
SSH into the backend instance and run these commands to confirm the role is working as expected:

```bash
aws s3 ls                           # S3 read access
aws dynamodb list-tables --region <your-region>   # DynamoDB access
aws sts get-caller-identity         # Confirms the role is attached
