# Multi-Tier App Troubleshooting Playground

[![AWS](https://img.shields.io/badge/AWS-EC2_VPC_RDS_ELB-FF9900?style=flat-square&logo=amazon-aws)](https://aws.amazon.com/)
[![Terraform](https://img.shields.io/badge/Terraform-85.2%25-7B42BC?style=flat-square&logo=terraform)](https://www.terraform.io/)
[![Python](https://img.shields.io/badge/Python-Backend-3776AB?style=flat-square&logo=python)](https://www.python.org/)
[![CloudFormation](https://img.shields.io/badge/CloudFormation-IaC-FF9900?style=flat-square&logo=amazon-aws)](https://aws.amazon.com/cloudformation/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](LICENSE)

> Learning project exploring multi-tier application architecture and troubleshooting workflows on AWS.

---

## 📋 About This Project

A hands-on learning project where I designed and documented a multi-tier application architecture to understand how frontend, backend, and database layers interact. This demonstrates systematic troubleshooting approaches and infrastructure design concepts relevant to Cloud Support and DevOps roles.

**Built for:** Learning multi-tier architecture patterns and developing troubleshooting methodologies for Cloud Support Engineer positions.

---

## 🎯 Skills Practiced

| Area | Technologies |
|------|--------------|
| **Architecture Design** | Three-tier application pattern (Frontend, Backend, Database) |
| **Infrastructure as Code** | Terraform (85.2%), CloudFormation |
| **Compute** | EC2 instances, Auto Scaling Groups |
| **Load Balancing** | Application Load Balancer, Network Load Balancer |
| **Networking** | VPC, subnets, security groups, route tables |
| **Database** | RDS MySQL/PostgreSQL, read replicas |
| **Monitoring** | CloudWatch logs, metrics, alarms |
| **Troubleshooting** | Systematic diagnostic workflows |

---

## 🏗️ System Architecture

### Complete Multi-Tier Design

```mermaid
graph TB
    subgraph "Public Internet"
        A[End Users]
    end
    
    subgraph "AWS Cloud - VPC"
        subgraph "Public Subnet - AZ1"
            B[Application Load Balancer]
        end
        
        subgraph "Private Subnet - Frontend"
            C[Frontend EC2 - AZ1]
            D[Frontend EC2 - AZ2]
        end
        
        subgraph "Private Subnet - Backend"
            E[Backend API - AZ1]
            F[Backend API - AZ2]
        end
        
        subgraph "Private Subnet - Database"
            G[RDS Primary - AZ1]
            H[RDS Read Replica - AZ2]
        end
        
        subgraph "Monitoring & Logs"
            I[CloudWatch]
            J[CloudWatch Logs]
        end
    end
    
    A --> B
    B --> C
    B --> D
    C --> E
    D --> F
    E --> G
    F --> G
    G --> H
    
    C --> I
    D --> I
    E --> J
    F --> J
    G --> I
    
    style B fill:#FF9900
    style C fill:#3776AB
    style D fill:#3776AB
    style E fill:#51cf66
    style F fill:#51cf66
    style G fill:#527FFF
    style H fill:#527FFF
    style I fill:#ffd43b
```

---

### Application Request Flow

```mermaid
sequenceDiagram
    participant User as End User
    participant ALB as Load Balancer
    participant FE as Frontend Server
    participant BE as Backend API
    participant DB as RDS Database
    participant CW as CloudWatch
    
    User->>ALB: HTTPS Request
    ALB->>ALB: Health check routing
    ALB->>FE: Forward to healthy instance
    FE->>BE: Internal API call
    BE->>DB: SQL query
    DB-->>BE: Query results
    BE-->>FE: JSON response
    FE-->>ALB: Rendered HTML
    ALB-->>User: HTTPS Response
    
    FE->>CW: Log metrics
    BE->>CW: Log API calls
    DB->>CW: Log performance
    
    Note over User,CW: Each tier monitored independently
```

---

### Troubleshooting Decision Tree

```mermaid
graph TD
    subgraph "Systematic Troubleshooting Approach"
        A[Application Error Reported] --> B{Which Layer Failing?}
        
        B -->|Frontend| C[Check Load Balancer]
        B -->|Backend| D[Check API Health]
        B -->|Database| E[Check DB Connection]
        
        C --> F{ALB Health Checks}
        F -->|Failing| G[Review Security Groups]
        F -->|Passing| H[Check Frontend Logs]
        
        D --> I{API Responding?}
        I -->|No Response| J[Check Backend Instances]
        I -->|500 Errors| K[Review Application Logs]
        
        E --> L{DB Reachable?}
        L -->|Connection Timeout| M[Check RDS Security Group]
        L -->|Slow Queries| N[Analyze DB Performance]
        
        G --> O[Add Missing Inbound Rules]
        H --> P[Check Application Errors]
        J --> Q[Restart Backend Service]
        K --> R[Debug Code Issues]
        M --> S[Update DB Security Group]
        N --> T[Optimize Queries]
        
        O --> U[Test & Verify]
        P --> U
        Q --> U
        R --> U
        S --> U
        T --> U
        
        U --> V[Document Solution]
    end
    
    style A fill:#ff6b6b
    style U fill:#ffd43b
    style V fill:#51cf66
```

---

### Network Architecture & Security

```mermaid
graph LR
    subgraph "VPC 10.0.0.0/16"
        subgraph "Public Subnet"
            A[Internet Gateway]
            B[NAT Gateway]
            C[ALB]
        end
        
        subgraph "Private Subnet - Frontend"
            D[Frontend SG]
            E[Frontend Instances]
        end
        
        subgraph "Private Subnet - Backend"
            F[Backend SG]
            G[Backend Instances]
        end
        
        subgraph "Private Subnet - Database"
            H[DB SG]
            I[RDS Instance]
        end
    end
    
    A --> C
    C --> D
    D --> E
    E --> B
    E --> F
    F --> G
    G --> H
    H --> I
    
    style A fill:#51cf66
    style C fill:#FF9900
    style D fill:#ffd43b
    style F fill:#ffd43b
    style H fill:#ffd43b
    style I fill:#527FFF
```

---

### Terraform Deployment Workflow

```mermaid
flowchart TD
    subgraph "Infrastructure as Code Pipeline"
        A[Write Terraform Config] --> B[terraform init]
        B --> C[terraform validate]
        C --> D{Syntax Valid?}
        
        D -->|Yes| E[terraform plan]
        D -->|No| F[Fix Errors]
        F --> C
        
        E --> G{Review Plan}
        G -->|Approve| H[terraform apply]
        G -->|Changes Needed| A
        
        H --> I[Deploy VPC]
        H --> J[Deploy EC2]
        H --> K[Deploy RDS]
        H --> L[Deploy ALB]
        
        I --> M[Verify Resources]
        J --> M
        K --> M
        L --> M
        
        M --> N{All Healthy?}
        N -->|Yes| O[Save State]
        N -->|No| P[Troubleshoot]
        
        O --> Q[Infrastructure Ready]
        P --> R[Check Logs]
        R --> A
    end
    
    style H fill:#7B42BC
    style Q fill:#51cf66
    style P fill:#ff6b6b
```

---

### Monitoring & Alerting Flow

```mermaid
graph TB
    subgraph "CloudWatch Monitoring Pipeline"
        A[EC2 Metrics] --> B[CloudWatch]
        C[RDS Metrics] --> B
        D[ALB Metrics] --> B
        E[Application Logs] --> F[CloudWatch Logs]
        
        B --> G{Threshold Exceeded?}
        G -->|CPU > 80%| H[High CPU Alarm]
        G -->|Errors > 10| I[Error Rate Alarm]
        G -->|Latency > 2s| J[Latency Alarm]
        
        H --> K[SNS Topic]
        I --> K
        J --> K
        
        K --> L[Email Alert]
        K --> M[Lambda Auto-Remediation]
        
        F --> N[Log Insights Query]
        N --> O[Error Pattern Detection]
        O --> K
        
        M --> P[Scale Resources]
        M --> Q[Restart Services]
        M --> R[Update Config]
    end
    
    style H fill:#ff6b6b
    style I fill:#ff6b6b
    style J fill:#ff6b6b
    style L fill:#ffd43b
    style P fill:#51cf66
```

---

## 📸 Learning Documentation

### Application Workflow Screenshots

<details>
<summary>📋 View Complete User Journey</summary>

**Step 1: User Login Interface**
![User Login](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_01_UserLogin.png)
*Login page demonstrating frontend authentication flow*

---

**Step 2: Main Dashboard**
![Main Dashboard](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_02_MainDashboard.png)
*Dashboard showing successful frontend-backend integration*

---

**Step 3: Error Logs View**
![Error Logs](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_03_ErrorLogsView.png)
*Error log interface for troubleshooting application issues*

---

**Step 4: API Response Testing**
![API Response](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_04_APIResponse.png)
*Backend API response validation*

---

**Step 5: Admin Authentication**
![Admin Login](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_05_AdminLogin.png)
*Administrative access with elevated permissions*

---

**Step 6-7: Admin Error Log Analysis**
![Admin Error Logs](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_07_AdminErrorLogs.png)
*Detailed error log review from admin perspective*

![Combined Admin Logs](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_07_08_AdminErrorLogs.png)
*Aggregated error log analysis*

---

**Step 8: Admin API Validation**
![Admin API Response](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_08_10_AdminAPIResponse.png)
*API response verification with admin privileges*

---

**Step 9: Secondary User Flow**
![Secondary Login](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_09_11_SecondaryLogin.png)
*Testing multi-user scenarios*

---

**Step 10: Secondary Dashboard**
![Secondary Dashboard](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_10_12_SecondaryDashboard.png)
*User-specific dashboard rendering*

---

**Step 11: Secondary Error Logs**
![Secondary Error Logs](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_11_13_SecondaryErrorLogs.png)
*Error logging from different user context*

---

**Step 12: Secondary API Response**
![Secondary API Response](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_12_14_SecondaryAPIResponse.png)
*API behavior with secondary user credentials*

---

**Step 13: Tertiary User Testing**
![Tertiary Login](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_13_15_TertiaryLogin.png)
*Additional user scenario validation*

---

**Step 14: Tertiary Dashboard**
![Tertiary Dashboard](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_14_17_TertiaryDashboard.png)
*Dashboard consistency across users*

---

**Step 15: Tertiary Error Logs**
![Tertiary Error Logs](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_15_18_TertiaryErrorLogs.png)
*Error tracking across multiple user sessions*

---

**Step 16: Tertiary API Response**
![Tertiary API Response](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_16_20_TertiaryAPIResponse.png)
*API consistency validation*

---

**Step 17: Final Test Authentication**
![Final Test Login](https://raw.githubusercontent.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground/main/screenshots/Multi_17_21_TestLogin.png)
*Comprehensive testing completion*

</details>

---

## 📁 Project Structure

```
Multi-Tier-App-Troubleshooting-Playground/
├── terraform/              # Infrastructure as Code
│   ├── vpc.tf             # VPC and networking
│   ├── ec2.tf             # Frontend and backend instances
│   ├── rds.tf             # Database configuration
│   ├── alb.tf             # Load balancer setup
│   └── security_groups.tf # Security rules
├── backend/                # Backend API code
├── frontend/               # Frontend application
├── database/               # Database schemas
├── diagrams/               # Architecture diagrams
│   └── Architecture diagram.png
├── scenarios/              # Troubleshooting scenarios
├── screenshots/            # Documentation (17 images)
├── scripts/                # Automation scripts
├── monitoring/             # CloudWatch configurations
├── workflows/              # CI/CD workflows
├── main.tf                 # Root Terraform config
├── outputs.tf              # Terraform outputs
└── README.md               # This file
```

---

## 🚀 Getting Started

### Prerequisites

- AWS Account (Free Tier eligible)
- Terraform 1.0+
- AWS CLI configured
- Python 3.8+ (for backend)

### Deployment Steps

```bash
# Clone repository
git clone https://github.com/charles-bucher/Multi-Tier-App-Troubleshooting-Playground.git
cd Multi-Tier-App-Troubleshooting-Playground

# Initialize Terraform
cd terraform
terraform init

# Review infrastructure plan
terraform plan

# Deploy infrastructure
terraform apply

# Get outputs
terraform output
```

### Access the Application

```bash
# Get Load Balancer DNS
terraform output alb_dns_name

# Open in browser
http://<alb_dns_name>
```

---

## 📚 What I Learned

### Architecture Concepts
- **Three-tier design pattern**: Separation of frontend, backend, and database
- **High availability**: Multi-AZ deployment for redundancy
- **Load balancing**: Distributing traffic across instances
- **Security layers**: Network segmentation with security groups

### AWS Services
- **EC2**: Instance types, Auto Scaling Groups, placement
- **VPC**: Subnets, route tables, Internet Gateway, NAT Gateway
- **ELB**: Application Load Balancer configuration and health checks
- **RDS**: Managed database, read replicas, backup strategies
- **CloudWatch**: Metrics collection, log aggregation, alarms

### Troubleshooting Methodology
- **Systematic approach**: Layer-by-layer diagnosis
- **Log analysis**: Reading CloudWatch logs for error patterns
- **Network debugging**: Security group rules, route table validation
- **Performance tuning**: Identifying bottlenecks

### Infrastructure as Code
- **Terraform modules**: Reusable infrastructure components
- **State management**: Remote state with S3
- **Resource dependencies**: Proper ordering of resource creation
- **Variable management**: Parameterized configurations

---

## 🎯 Next Steps

**Planned Improvements:**
- [ ] Add auto-scaling policies based on CPU/memory
- [ ] Implement CI/CD pipeline with GitHub Actions
- [ ] Add WAF rules for security
- [ ] Create disaster recovery runbook
- [ ] Add comprehensive monitoring dashboards
- [ ] Implement blue-green deployment strategy

---

## 💼 Skills for Job Applications

This project demonstrates understanding of:

**Cloud Support Engineer:**
- Multi-tier application architecture
- Systematic troubleshooting approaches
- AWS service integration
- Log analysis and debugging

**DevOps Engineer:**
- Infrastructure as Code (Terraform 85.2% of codebase)
- Automated deployment workflows
- Monitoring and alerting setup
- High availability design

**Solutions Architect:**
- Three-tier architecture design
- Security best practices
- Scalability planning
- Cost optimization considerations

---

## 📧 Contact

**Charles Bucher**  
📍 Pinellas Park, Florida  
✉️ quietopscb@gmail.com  
🔗 [GitHub](https://github.com/charles-bucher) • [LinkedIn](https://linkedin.com/in/charles-bucher-cloud)

Currently building cloud infrastructure skills and seeking Cloud Support Engineer or Junior DevOps opportunities.

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Learning Resources

Built while learning from:
- AWS Well-Architected Framework
- Terraform AWS Provider Documentation
- Multi-tier application design patterns
- Cloud troubleshooting best practices

---

**Keywords for ATS:** AWS, Multi-Tier Architecture, Terraform, Infrastructure as Code, EC2, VPC, RDS, Load Balancer, CloudWatch, Troubleshooting, DevOps, Cloud Support, Three-Tier Application, High Availability, Auto Scaling, Security Groups, CloudFormation, Python, Monitoring, Incident Response