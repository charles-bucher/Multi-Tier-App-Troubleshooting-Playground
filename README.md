# Multi-Tier App Troubleshooting Playground

**Cloud Support | NOC & CloudOps | AWS Monitoring & Automation | Python / Terraform**

This repo provides a hands-on multi-tier application troubleshooting playground, complete with screenshots, Terraform setup, AWS EC2 instances, IAM roles, and monitoring workflows. It is intended for learning, practicing cloud operations, and demonstrating automation skills.

---

## Table of Contents

- [Overview](#overview)
- [Scenario 01 – Setup & IAM Roles](#scenario-01--setup--iam-roles)
- [Scenario 02 – EC2 & Networking](#scenario-02--ec2--networking)
- [Scenario 03 – SSH Access & App Deployment](#scenario-03--ssh-access--app-deployment)
- [Folder Structure](#folder-structure)
- [Tech Stack](#tech-stack)
- [Author](#author)

---

## Overview

This multi-tier app playground demonstrates:

- Cloning and configuring repos
- AWS IAM and EC2 setup
- Security group and networking configuration
- SSH access to instances
- Application deployment on Apache
- Directory and system verification
- Automated monitoring and troubleshooting

All steps are illustrated with **screenshots** in the `docs/screenshots/` folder.

---

## Scenario 01 – Setup & IAM Roles

1. **Clone the Repo**  
![Multi_01_cloned](docs/screenshots/Multi_01_cloned.png)

2. **Configure AWS CLI**  
![Multi_02_CLI_configured](docs/screenshots/Multi_02_CLI_configured.png)

3. **IAM Role Creation Complete**  
![Multi_03_IAM_Role_Creation_Complete](docs/screenshots/Multi_03_IAM_Role_Creation_Complete.png)

4. **IAM Role Details**  
![Multi_iam_role](docs/screenshots/Multi_iam_role.png)

**Outcome:** Repo cloned, AWS CLI configured, IAM roles created and verified.

---

## Scenario 02 – EC2 & Networking

1. **EC2 Instance List**  
![Multi_04_EC2_Instance_List](docs/screenshots/Multi_04_EC2_Instance_List.png)

2. **EC2 Instance Details**  
![Multi_05_EC2_Instance_Details](docs/screenshots/Multi_05_EC2_Instance_Details.png)

3. **Security Group Rules**  
![Multi_06_Security_Group_Rules](docs/screenshots/Multi_06_Security_Group_Rules.png)

4. **EC2 Running**  
![Multi_09_Ec2_Running](docs/screenshots/Multi_09_Ec2_Running.png)

5. **EC2 Detailed Verification**  
![Multi_Ec2_details](docs/screenshots/Multi_Ec2_details.png)

**Outcome:** EC2 instances up, networking rules applied, security groups verified.

---

## Scenario 03 – SSH Access & App Deployment

1. **SSH Key Generated**  
![Multi_07_SSH_Key_Generated](docs/screenshots/Multi_07_SSH_Key_Generated.png)

2. **Frontend Role Verification**  
![Multi_08_-Frontend-Role](docs/screenshots/Multi_08_-Frontend-Role.png)

3. **SSH Confirm**  
![Multi_ssh_confirm](docs/screenshots/Multi_ssh_confirm.png)

4. **SSH Success**  
![Multi_ssh_success](docs/screenshots/Multi_ssh_success.png)

5. **Repo Cloned**  
![Multi_10_Repo_Cloned](docs/screenshots/Multi_10_Repo_Cloned.png)

6. **Apache Installed**  
![Multi_Apache_installed](docs/screenshots/Multi_Apache_installed.png)

7. **Apache Start & Enable**  
![Multi_14_Apache_Start_Enable](docs/screenshots/Multi_14_Apache_Start_Enable.png)

8. **Backend Directory Structure**  
![Multi_15_Backend_Directory_Structure](docs/screenshots/Multi_15_Backend_Directory_Structure.png)

9. **Database Directory Structure**  
![Multi_16_Database_Directory_Structure](docs/screenshots/Multi_16_Database_Directory_Structure.png)

10. **Misc Verification Screenshot**  
![Multi_screenshot](docs/screenshots/Multi_screenshot.png)

11. **System Verification**  
![Multi_system_info](docs/screenshots/Multi_system_info.png)

**Outcome:** SSH confirmed, app deployed, Apache running, directories verified, system checked.

---

## Folder Structure

```text
Multi-Tier-App-Troubleshooting-Playground/
├─ docs/
│  ├─ screenshots/
│  │  ├─ Multi_01_cloned.png
│  │  ├─ Multi_02_CLI_configured.png
│  │  ├─ Multi_03_IAM_Role_Creation_Complete.png
│  │  ├─ Multi_04_EC2_Instance_List.png
│  │  └─ ... (all screenshots)
├─ backend/
├─ frontend/
├─ README.md
└─ Terraform/
Tech Stack
AWS – EC2, IAM, Security Groups

Terraform – Provisioning EC2 and IAM

Python – Automation scripts

Linux – Backend and frontend servers

Apache – Web server

Author
Charles Bucher
Hands-on CloudOps & NOC portfolio
GitHub: charles-bucher

yaml
Copy code

---

This README:

- Embeds **all 19 screenshots** you listed.
- Groups them by scenario with **step numbers** and brief descriptions.
- Provides **clear outcomes** per scenario.
- Maintains **folder structure visibility** and tech stack.

---