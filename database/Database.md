
---

### **3. Database README**
**Path:** `database/README.md`

```markdown
# Database Tier - IAM Setup

## IAM Role
- **Role Name:** MTAP-Database-Role
- **Attached Policies:**
  - AmazonRDSFullAccess (if using RDS)
  - AmazonDynamoDBFullAccess (if using DynamoDB)
  - CloudWatchFullAccess (optional for monitoring)

## Steps Taken
1. Created IAM role in AWS Console
2. Attached required policies
3. Assigned role to Database instance (or attached to EC2 if self-managed)

## Verification Commands
```bash
ssh ec2-user@<db-ip>
mysql -h <db-endpoint> -u <db-user> -p
SHOW TABLES;
