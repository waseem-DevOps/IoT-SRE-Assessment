

🌐 Web Application Infrastructure on AWS with Terraform
This repository provisions a complete infrastructure for a web application on AWS using Terraform.
It includes networking, compute, database, IAM, DNS, and serverless components.

📦 Infrastructure Components
Component	Description
VPC	Custom VPC with 2 subnets (public and private)
EC2	Instance in the private subnet for app backend
RDS	PostgreSQL instance (encrypted) in private subnet
Security Groups	Allow HTTP (80) and SSH (22) traffic
IAM Role	Allows EC2 instance to read from S3
Route 53	Custom domain for accessing the application
S3	Encrypted bucket for storing static assets
Lambda	Function interacting with PostgreSQL DB
API Gateway	REST API connected to Lambda

🗂 Project Structure
bash
Copy
Edit
terraform/
├── main.tf                # Root module (calls other modules)
├── variables.tf           # Variables used in the project
├── outputs.tf             # Useful outputs (e.g., EC2 IP, domain)
├── modules/
│   ├── vpc/               # VPC and subnets
│   ├── ec2/               # EC2 instance and security groups
│   ├── rds/               # RDS PostgreSQL instance
│   ├── iam/               # IAM role and policies
│   ├── s3/                # Encrypted S3 bucket
│   ├── lambda/            # Lambda function definition
│   ├── api_gateway/       # API Gateway configuration
│   └── route53/           # Custom domain setup
└── README.md              # This file
✅ Prerequisites
AWS Account with admin access

AWS CLI configured (aws configure)

Terraform CLI v1.5+ installed

Domain registered in Route 53 (e.g., example.com)

SSH key pair (if deploying EC2)

🚀 Setup Instructions
1. Clone the Repository
bash
Copy
Edit
git clone https://github.com/your-username/aws-webapp-terraform.git
cd aws-webapp-terraform/terraform
2. Initialize Terraform
bash
Copy
Edit
terraform init
3. Review and Modify Variables
Edit variables.tf to configure:

VPC CIDR blocks

EC2 instance type

RDS DB name, user, password

Your registered domain in Route 53

4. Plan Infrastructure
bash
Copy
Edit
terraform plan
5. Deploy Infrastructure
bash
Copy
Edit
terraform apply
This will:

Create a full network

Launch EC2 instance with IAM role

Launch encrypted RDS PostgreSQL instance

Configure Route 53 custom domain

Deploy Lambda + API Gateway REST API

🧹 Destroy Infrastructure
To tear down everything:

bash
Copy
Edit
terraform destroy
📤 Outputs
After terraform apply, you'll get:

EC2 private IP

RDS endpoint

Route 53 domain URL

API Gateway endpoint

📝 Notes
The EC2 instance runs in a private subnet and needs a NAT Gateway for internet access if needed.

Lambda connects to RDS via VPC configuration — make sure subnets and SGs are correct.

You must provide your own .zip file for the Lambda deployment (inside /lambda/function.zip).

Make sure your domain is managed in Route 53 and update its hosted zone ID in the route53 module.


