# Multi-Tier Application Architecture

## Overview
This project demonstrates a production-ready 3-tier web application architecture on AWS.

## Architecture Diagram
`
                     Internet
                        |
                        v
                 +-------------+
                 |  Frontend   |
                 |  Web Server |
                 |  (Apache)   |
                 |  Port 80    |
                 +------+------+
                        |
                        v
                 +-------------+
                 |  Backend    |
                 |  App Server |
                 |  (Node.js)  |
                 |  Port 8080  |
                 +------+------+
                        |
                        v
                 +-------------+
                 |  Database   |
                 | (PostgreSQL)|
                 |  Port 5432  |
                 +-------------+
`

## Components

### Frontend Tier
- **Technology:** Apache Web Server
- **Instance Type:** t2.micro
- **Ports:** 80 (HTTP), 22 (SSH)
- **Security Group:** frontend-sg

### Backend Tier
- **Technology:** Node.js / Python
- **Instance Type:** t2.micro
- **Ports:** 8080 (App), 22 (SSH)
- **Security Group:** backend-sg

### Database Tier
- **Technology:** PostgreSQL
- **Instance Type:** t2.micro
- **Ports:** 5432, 22 (SSH)
- **Security Group:** database-sg

## Security Group Rules

### Frontend (frontend-sg)
**Inbound:**
- Port 80 from 0.0.0.0/0 (public web)
- Port 22 from YOUR_IP/32 (SSH)

**Outbound:**
- Port 8080 to backend-sg
- All to 0.0.0.0/0

### Backend (backend-sg)
**Inbound:**
- Port 8080 from frontend-sg
- Port 22 from YOUR_IP/32

**Outbound:**
- Port 5432 to database-sg
- All to 0.0.0.0/0

### Database (database-sg)
**Inbound:**
- Port 5432 from backend-sg
- Port 22 from YOUR_IP/32

## Skills Demonstrated
- Multi-tier architecture
- Security groups
- IAM roles
- Network segmentation
- Infrastructure as Code
