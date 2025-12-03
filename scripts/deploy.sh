#!/bin/bash

echo "Deploying Multi-Tier App Troubleshooting Playground..."

cd terraform

# Initialize Terraform
terraform init

# Plan deployment
terraform plan -out=tfplan

# Apply if approved
read -p "Review the plan above. Deploy? (yes/no): " response
if [ "$response" = "yes" ]; then
    terraform apply tfplan
    echo "Deployment complete!"
    echo "Load Balancer DNS:"
    terraform output load_balancer_dns
else
    echo "Deployment cancelled."
fi
