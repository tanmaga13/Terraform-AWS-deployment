Terraform-based AWS ECS Fargate deployment with Flask backend and Express frontend using Docker, ALB, and CI/CD
# 🚀 Terraform + AWS ECS Fargate Deployment (Flask + Express)

## 📌 Overview

This project demonstrates end-to-end deployment of a microservices application using Infrastructure as Code (IaC) with Terraform on AWS.

It consists of:

* **Flask Backend** (Python) running on port `8000`
* **Express Frontend** (Node.js) running on port `3000`

Both services are containerized using Docker and deployed on AWS ECS Fargate behind an Application Load Balancer (ALB).

---

## 🏗️ Architecture

```
User → ALB → ECS Fargate
            ├── Frontend (3000)
            └── Backend (8000)
```

* `/` → routed to Frontend
* `/api` → routed to Backend

---

## ⚙️ Technologies Used

* Terraform (Infrastructure as Code)
* AWS ECS Fargate
* AWS ECR (Docker Image Registry)
* AWS VPC (Custom Networking)
* AWS Application Load Balancer (ALB)
* Docker (Containerization)
* Flask (Backend)
* Express.js (Frontend)

---

## 📁 Project Structure

```
terraform/
├── provider.tf
├── vpc.tf
├── security.tf
├── ecr.tf
├── alb.tf
├── ecs.tf
├── outputs.tf
├── .gitignore
└── README.md
```

---

## 🚀 Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Apply Infrastructure

```bash
terraform apply
```

### 3. Get ALB URL

```bash
terraform output alb_url
```

---

## 🌐 Access Application

Open in browser:

```
http://<alb_url>
```

---

## 🔍 Verification

* Frontend loads via ALB
* Backend accessible via:

```
http://<alb_url>/api
```

* ECS Tasks are in `RUNNING` state
* Logs available in CloudWatch

---

## 🔧 Configuration Details

### Backend

* Port: `8000`
* Must bind to:

```python
app.run(host="0.0.0.0", port=8000)
```

### Frontend

* Port: `3000`
* Uses environment variable:

```javascript
const URL = process.env.BACKEND_URL;
```

---

## ⚠️ Important Notes

* ECR images are pre-built and reused
* Region used: `ap-south-2`
* ALB requires **minimum 2 subnets in different AZs**
* Security groups allow traffic from ALB to ECS

---

## 🧠 Key Learnings

* ECS Fargate eliminates need for server management
* ALB routing enables microservices architecture
* Terraform ensures reproducible infrastructure
* Proper port mapping is critical in container deployments

---

## ❗ Common Issues

| Issue           | Cause                                 |
| --------------- | ------------------------------------- |
| 502 Error       | Port mismatch / container not running |
| No response     | App not bound to `0.0.0.0`            |
| ECS task stops  | Image crash or misconfiguration       |
| API not working | Incorrect backend URL                 |

---

## 📈 Future Improvements

* Add HTTPS using AWS ACM
* Implement Auto Scaling for ECS services
* Integrate CI/CD (GitHub Actions)
* Add monitoring with CloudWatch alarms

---

## 👨‍💻 Author

Tanmay

---

## 📜 License

This project is for learning and demonstration purposes.
