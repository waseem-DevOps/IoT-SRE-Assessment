## AWS Web Application Infrastructure using Terraform

This project provisions a secure and scalable web application infrastructure on AWS using Terraform. It is modular, maintainable, and production-ready.

---

## Project Overview

The infrastructure includes:

1. A **VPC** with public and private subnets.
2. An **EC2 instance** in the private subnet (application server).
3. An **RDS PostgreSQL database** (encrypted) in the private subnet.
4. **Security Groups** to allow safe traffic between components and open ports (80/22).
5. An **IAM role** for EC2 with S3 read access.
6. A **Route 53 DNS record** pointing to the application.
7. **S3 bucket** (encrypted) for object storage.
8. A **Lambda function** interacting with the RDS.
9. An **API Gateway** exposing the Lambda via REST API.

This setup provides a realistic cloud architecture for web applications that require backend compute, database, and serverless functions.

---


## Deployment Steps

1. **Clone the repo**

```bash
git clone https://github.com/your-username/terraform-aws-.git
cd terraform-aws

2. Initialize Terraform

'''bash
terraform init

3. Apply the Configuration

'''bash
terraform apply

## To delete all resources created:

'''bash
terraform destroy
