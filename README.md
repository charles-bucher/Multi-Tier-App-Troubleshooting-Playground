Multi-Tier App Troubleshooting Playground 🛠️

Hands-on AWS lab for deploying, monitoring, and troubleshooting multi-tier web apps.

What It Does (5 seconds)

Deploys a realistic multi-tier AWS environment: frontend, backend, database.

Simulates operational failures for hands-on troubleshooting.

Builds monitoring dashboards and automated alerts for real-world practice.

Problem It Solves

Practice incident response, troubleshooting, and root cause analysis without touching production systems.

AWS Services & Tech

EC2, VPC, ELB, RDS, IAM, S3

CloudWatch (dashboards, alarms, logs)

Lambda, SNS, Python scripting

Terraform & CloudFormation

Skills Demonstrated

Multi-tier AWS deployment & infrastructure as code

Troubleshooting EC2, RDS, IAM, ELB, networking

Monitoring & automated alerting pipelines

Incident response documentation

CI/CD workflows & Python automation

Quick Start
git clone <repo-url>
cd Multi-Tier-App-Troubleshooting-Playground
terraform init
terraform apply


Verify connectivity & IAM permissions.

Start frontend/backend services & test database access.

Run troubleshooting scenarios:

EC2 failure recovery

IAM permission errors

Database connectivity issues

Load balancer health check failures

Network routing problems

Lab Walkthrough (Screenshots)

Authentication & Access Control


Monitoring Dashboard


Error Logs


API Testing & Validation


System Architecture


Project Structure
backend/          # Application tier
frontend/         # Web tier
database/         # DB scripts
diagrams/         # Architecture diagrams
docs/             # Troubleshooting playbooks
screenshots/      # Lab walkthrough images
workflows/        # CI/CD automation
main.tf           # Terraform deployment
outputs.tf        # Terraform outputs
variables.tf      # Config variables

Contact

GitHub: charles-bucher

Portfolio: charles-bucher.github.io

LinkedIn: charles-bucher-cloud

Email: quietopscb@gmail.com

License

MIT License