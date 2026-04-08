# 🚀 AWS Terraform Platform – Production-Style IaC

## 📌 Overview

This project demonstrates a **production-style Infrastructure as Code (IaC) platform** built using Terraform on AWS.

It provisions a **scalable, load-balanced environment** capable of hosting applications with minimal manual intervention.

---

## 🏗️ Architecture
Internet
↓
Application Load Balancer (ALB)
↓
Target Group
↓
Auto Scaling Group (EC2)
↓
Application (Nginx / Future App)


---

## ⚙️ Key Features

- Modular Terraform architecture  
- Multi-environment ready (dev/staging/prod)  
- Auto Scaling with Launch Templates  
- ALB-based traffic routing  
- Remote state management (S3 + DynamoDB)  
- Fully automated EC2 bootstrap using user_data  

---

## ☁️ Infrastructure Components

| Component | Description |
|----------|------------|
| VPC | Custom network with CIDR |
| Subnets | Public subnets across AZs |
| Internet Gateway | External connectivity |
| ALB | Load balancing |
| Target Group | Health-based routing |
| ASG | Auto scaling EC2 |
| EC2 | Application hosting |
| S3 | Remote state storage |
| DynamoDB | State locking |

---

## 🔄 Deployment Flow
1. Terraform Init (S3 backend + DynamoDB lock)
2. Terraform Apply
3. VPC + Networking Provisioned
4. ALB Created
5. ASG Launches EC2
6. user_data installs & starts application
7. ALB routes traffic to healthy instances


---

## 🧪 Validation Steps

- Check ALB DNS  
- Verify Target Group health  
- Confirm EC2 instances are running  
- Access application via browser  

---

## ⚠️ Challenges & Fixes

### 🔴 EC2 Bootstrap Failure
- Cause: No internet access (missing route table association)  
- Fix: Added route table association  

---

### 🔴 ALB Health Check Failed
- Cause: Application not running  
- Fix: Installed nginx using user_data  

---

### 🔴 Infinite ASG Instance Creation
- Cause: Health check failures  
- Fix: Resolved networking and application setup  

---

## 🧠 Key Learnings

- Importance of networking (route tables, subnets)  
- ALB health checks impact ASG behavior  
- Debugging using cloud-init logs  
- Terraform module design and reusability  

---

## 🚀 Future Enhancements

- Private subnet architecture + NAT Gateway  
- Dockerized application deployment  
- HTTPS (ACM + ALB)  
- RDS integration  
- Monitoring (CloudWatch)

---

## 📸 Screenshots

<img width="1913" height="1034" alt="image" src="https://github.com/user-attachments/assets/3bc3d86d-aaca-474c-9cad-defa0db823f0" />

- Terraform Apply Success    

---

## 🤝 Connect

- GitHub: https://github.com/Sachin8801  
- LinkedIn: https://linkedin.com/in/sachin-singh-8166b3134  

---
