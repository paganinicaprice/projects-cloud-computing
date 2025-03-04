# Load Balancer Microservice - Cloud Computing Project

**Author:** paganinicaprice
**Project Goal:** Develop a cloud-based microservice with Nginx as a load balancer and a Flask backend, deployed on AWS using Terraform.

---

## Overview  
Load Balancer Microservice is a cloud-based application that utilizes Nginx as a reverse proxy to distribute traffic to a Flask microservice.  
The infrastructure is provisioned using Terraform, and the application runs on AWS EC2 instances.  

### Key Features:  
- Nginx as a reverse proxy load balancer  
- Flask microservice backend  
- Infrastructure as Code using Terraform  
- Secure environment variables management  
- Deployed on AWS with an Elastic IP  

---

## Technologies Used  

| Technology  | Purpose                        |
|------------|--------------------------------|
| Terraform  | Infrastructure as Code        |
| AWS EC2    | Cloud-based virtual machines  |
| Nginx      | Reverse proxy & load balancing |
| Flask      | Web framework for microservice |
| Python 3.9 | Backend programming language  |
| GitHub     | Version control               |

---

## Project Structure  
```md
loadbalancer-microservice/
├── terraform/              # Terraform configuration files
│   ├── main.tf            # Defines AWS infrastructure
│   ├── variables.tf       # Input variables for Terraform
│   ├── outputs.tf         # Terraform outputs
├── .gitignore              # Ignore unnecessary files
├── .env                    # Environment variables (excluded from Git)
├── Dockerfile              # Docker build configuration
├── app.py                  # Flask microservice code
├── nginx.conf              # Nginx reverse proxy configuration
├── requirements.txt        # Python dependencies
└── README.md               # Project documentation
```
---

## How to Install and Run Locally  

### 1. Clone the repository  

```sh
git clone https://github.com/YOUR-GITHUB-USERNAME/loadbalancer-microservice.git
cd loadbalancer-microservice

2. Set up a virtual environment

python -m venv venv
venv\Scripts\activate  # Windows
source venv/bin/activate  # Linux/Mac

3. Install dependencies

pip install -r requirements.txt

4. Run the Flask microservice

python app.py

5. Access the microservice
Open in browser:
http://127.0.0.1:5000

Running with Docker
1. Build the Docker image
docker build -t loadbalancer-microservice .

2. Run the container
docker run -p 5000:5000 --env-file .env loadbalancer-microservice

3. Check API in the browser
http://127.0.0.1:5000

Deploying with Terraform on AWS
1. Initialize Terraform
terraform init

2. Apply Terraform configuration
terraform apply -auto-approve

3. Retrieve the public IP
terraform output nginx_lb_static_ip

4. Access the Load Balancer
Copy the public IP and open:
http://<nginx_lb_static_ip>

Testing Load Balancer
Use curl to test requests:
curl http://<nginx_lb_static_ip>

Expected response:
<h1>Load Balancer is up!</h1>

License
This project is open-source and available under the MIT License.

Summary
Nginx-based load balancer
Flask microservice backend
Terraform for infrastructure automation
Deployed on AWS EC2 instances
Dockerized for easy deployment