Multi-Tier App Troubleshooting Playground
Hands-on AWS CloudOps lab for real troubleshooting, real incidents, and real resume power.

(What hiring managers see in 5 seconds: AWS Networking • EC2/App Issues • Multi-Tier debugging • Logs • Monitoring • SG/NACL mistakes • Broken app recovery)

📌 System Architecture
Primary Diagram

Shows the entire multi-tier layout: Load Balancer → Frontend → Backend API → Database → VPC networking + routing paths.

![Primary Diagram](diagrams/Multi-Tier_Diagram.png)
*High-level view of the full multi-tier system. Demonstrates understanding of VPC design, subnets, routing, load balancing, and service interactions.*

Detailed Diagram

Shows traffic flow, SG rules, IAM roles, subnet isolation, and where real troubleshooting happens.

![Detailed Diagram](diagrams/Multi-Tier_diagram_2.png)
*Deep dive into how traffic and AWS services interact. Shows where failures typically occur and what a Cloud Support engineer checks first.*

📸 Key Screenshots (with real skill explanations)

Use this format for each screenshot you're adding later:

### Login Page Connectivity  
![Login Test](screenshots/Multi_01_Login.png)  
*Confirms frontend reachability, EC2 health, SG ingress, and correct interface binding.*

### Backend API Failure  
![API Debug](screenshots/Multi_02_API_Failure.png)  
*Shows how to diagnose backend timeouts, incorrect SG rules, and ALB target group health.*

### RDS Connectivity Test  
![DB Check](screenshots/Multi_03_DB_Check.png)  
*Verifies VPC/subnet routing, NACL rules, and DB SG ingress/egress — core AWS support skills.*

### Security Group Misconfiguration  
![SG Error](screenshots/Multi_04_SG_Error.png)  
*Classic “works on frontend, breaks on backend” scenario — demonstrates practical debugging.*

### Successful Recovery  
![Success](screenshots/Multi_05_Success.png)  
*Final fixed state proving ability to diagnose, fix, validate, and close the incident properly.*


Add or remove sections depending on which screenshots you use.
The captions are the key — they show a hiring manager that you understand why the screenshot matters.

🛠️ Troubleshooting Scenarios (Clean Format)
1. Frontend loads, but backend is dead

Skills shown:

EC2 logs

ALB target health

Backend SG/NACL issues

cURL testing

CloudWatch Log Insights

2. Database unreachable from backend

Skills shown:

VPC routing + subnets

RDS SG vs EC2 SG relationships

Telnet/NC connectivity testing

IAM role verification

3. ALB returns 504 timeout

Skills shown:

ASG scaling/draining

ALB health check path debugging

App misconfiguration

Metric-based isolation logic

