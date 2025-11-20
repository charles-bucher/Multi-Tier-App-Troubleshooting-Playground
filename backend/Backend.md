
---

### **2. Backend README**
**Path:** `backend/README.md`

```markdown
# Backend Tier - IAM Setup

## IAM Role
- **Role Name:** MTAP-Backend-Role
- **Attached Policies:**
  - AmazonS3ReadOnlyAccess
  - AmazonDynamoDBFullAccess
  - AmazonEC2ReadOnlyAccess

## Steps Taken
1. Created IAM role in AWS Console
2. Attached required policies
3. Assigned role to Backend EC2 instance

## Verification Commands
```bash
ssh ec2-user@<backend-ip>
aws s3 ls
aws dynamodb list-tables
