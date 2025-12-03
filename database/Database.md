# Multi-Tier Application Architecture

## Overview
This setup models a real three-tier application running on AWS — not a toy lab. Each tier is isolated, communicates only with what it needs, and is locked down with security groups and IAM roles so you get the same patterns used in production environments.

## High-Level Flow

                     Internet
                        |
                        v
                 +-------------+
                 |  Frontend   |
                 | (Apache)    |
                 | Port 80     |
                 +------+------+
                        |
                        v
                 +-------------+
                 |  Backend    |
                 | (Node/Py)   |
                 | Port 8080   |
                 +------+------+
                        |
                        v
                 +-------------+
                 |  Database   |
                 | PostgreSQL  |
                 | Port 5432   |
                 +-------------+

The flow is simple: traffic hits the web server, the web server calls the backend API, and the backend talks to the database. Nothing is exposed that doesn’t need to be.

## Components

### Frontend Tier
- **Stack:** Apache Web Server
- **Instance:** `t2.micro`
- **Ports:** 80 (public), 22 (SSH)
- **Security Group:** `frontend-sg`
- Hosts static content and forwards everything else downstream.

### Backend Tier
- **Stack:** Node.js or Python app server
- **Instance:** `t2.micro`
- **Ports:** 8080 (API), 22 (SSH)
- **Security Group:** `backend-sg`
- Acts as the logic layer — receives requests from the frontend, hits the DB, returns responses.

### Database Tier
- **Stack:** PostgreSQL
- **Instance:** `t2.micro` (self-managed)
- **Ports:** 5432 (DB), 22 (SSH)
- **Security Group:** `database-sg`
- Only the backend can reach this tier. Nothing public, nothing unnecessary.

## Security Group Rules

### Frontend (`frontend-sg`)
**Inbound**
- 80 → `0.0.0.0/0`
- 22 → your workstation only (`YOUR_IP/32`)

**Outbound**
- 8080 → `backend-sg`
- General outbound allowed

### Backend (`backend-sg`)
**Inbound**
- 8080 → `frontend-sg`
- 22 → your workstation (`YOUR_IP/32`)

**Outbound**
- 5432 → `database-sg`
- General outbound allowed

### Database (`database-sg`)
**Inbound**
- 5432 → `backend-sg`
- 22 → your workstation (`YOUR_IP/32`)

**Outbound**
- Default outbound allowed (DB updates, patches, CloudWatch agents, etc.)

## Skills Demonstrated
- Designing and deploying a real three-tier architecture
- Enforcing least-privilege through SG chaining
- IAM role setups for backend and database operations
- Network isolation and clean traffic flow
- Implementing a pattern used in production stacks

