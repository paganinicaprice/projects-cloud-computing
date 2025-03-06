# Docker + Terraform: Nginx Web Server

## Overview
This project utilizes **Terraform** to manage infrastructure and **Docker** to deploy a simple Nginx-based static website. The website content is located in the `web/` directory and is served via an **Nginx container**.

Terraform automates the deployment process, ensuring a reproducible infrastructure setup.

## Technologies Used
- **Terraform** – Infrastructure as Code (IaC) management
- **Docker** – Containerization platform
- **Nginx** – Web server to host the static page
- **Git** – Version control system

## Project Structure
```sh
docker-terraform/
├── .terraform/                 # Terraform directory (auto-generated)
│   ├── providers/              # Terraform providers
│   │   ├── registry.terraform.io/
│   │   │   ├── kreuzwerker/
│   │   │   │   ├── docker/
│   │   │   │   │   ├── 3.0.2/
│   │   │   │   │   │   ├── windows_386/
├── web/                        # Directory containing the web page
│   ├── index.html              # Simple HTML page
├── .gitignore                  # Git ignore file
├── .terraform.lock.hcl          # Terraform lock file
├── main.tf                     # Terraform configuration file
├── terraform.tfstate            # Terraform state file (auto-generated)
├── terraform.tfstate.backup      # Terraform state backup file
```

---

## Installation & Setup

### 1. Clone the repository

### 2. Initialize Terraform
Run the following command to initialize Terraform and install required providers:
terraform init

### 3. Apply Terraform Configuration
To create the necessary infrastructure, run:
terraform apply
Confirm by typing `yes` when prompted.

### 4. Check Running Containers
Once Terraform completes, verify that the Nginx container is running:
docker ps

### 5. Access the Web Page
Open your browser and navigate to:
http://localhost

## License
This project is licensed under the **MIT License**.