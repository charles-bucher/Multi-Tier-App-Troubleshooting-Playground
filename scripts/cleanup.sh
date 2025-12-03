#!/bin/bash

echo "WARNING: This will destroy all resources in the troubleshooting playground."
read -p "Are you sure? (yes/no): " response

if [ "$response" = "yes" ]; then
    cd terraform
    terraform destroy
    echo "Cleanup complete."
else
    echo "Cleanup cancelled."
fi
