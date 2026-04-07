# 🚀 Terraform AWS Infrastructure Project

## 📌 Overview

This project demonstrates a **production-level AWS infrastructure** built using Terraform. It includes networking, compute, database, load balancing, and remote state management.

---

## 🏗️ Architecture

* VPC with public & private subnets
* Internet Gateway for public access
* Application Load Balancer (ALB)
* EC2 instances in private subnet
* Auto Scaling Group (ASG)
* RDS database
* Secure communication between services

---

## ⚙️ Technologies Used

* Terraform
* AWS (VPC, EC2, ALB, RDS, S3, DynamoDB)
* Linux (Ubuntu)
* Apache + PHP

---

## 📂 Project Structure

```
.
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── alb/
│   ├── rds/
│   └── autoscaling/
│
├── envs/
│   ├── dev/
│   ├── stage/
│   └── prod/
```

---

## 🔐 Remote Backend

* S3 bucket for storing Terraform state
* DynamoDB for state locking

---

## 🚀 How to Run

### 1. Initialize Terraform

```bash
cd envs/dev
terraform init
```

### 2. Plan

```bash
terraform plan -var-file="terraform.tfvars"
```

### 3. Apply

```bash
terraform apply -var-file="terraform.tfvars"
```

---

## 🌐 Application Flow

```
User → ALB → EC2 → RDS
```

---

## ⚠️ Key Learnings

* Importance of correct subnet design
* Difference between Multi-AZ and Read Replica
* Debugging ALB timeout issues
* Managing Terraform state remotely
* Avoiding manual changes in Terraform-managed infra

---

## 🐞 Issues Faced

* ALB timeout errors
* Security group misconfiguration
* Backend setup confusion
* VPC deletion dependency errors

---

## ✅ Solutions

* Fixed security group rules
* Corrected user_data scripts
* Implemented proper backend configuration
* Removed manual resource drift

---

## 📌 Best Practices Followed

* Infrastructure as Code (IaC)
* Modular Terraform design
* Environment-based deployment (dev/stage/prod)
* Remote state management

---

## 👨‍💻 Author

SilentKnight

---

## ⭐ Future Improvements

* Add CI/CD pipeline
* Implement monitoring (CloudWatch)
* Add HTTPS with ACM
* Introduce Kubernetes (EKS)

---
