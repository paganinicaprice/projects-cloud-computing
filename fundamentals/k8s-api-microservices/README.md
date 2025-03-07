# Docker API Microservices Manager  

## Overview  
This project demonstrates how to manage microservices using Docker API. Instead of using the Docker CLI, the Python script communicates directly with Docker’s local API to start, stop, and retrieve information about running containers.  

The project includes:  
- A simple Flask microservice  
- A Dockerfile to containerize the service  
- A Python script that interacts with Docker API via named pipes (`npipe://`) on Windows and Unix socket (`unix:///var/run/docker.sock`) on Linux/WSL  

## Technologies & Dependencies  

Technology | Purpose  
-----------|---------  
Docker | Containerization platform  
Python 3.9+ | Programming language  
Flask | Microservice framework  
Docker SDK for Python (`docker` library) | API communication  

## Project Structure  

```sh
k8s-api-microservices/
│── app.py                   # Flask-based microservice  
│── Dockerfile               # Dockerfile for building the microservice container  
│── k8s_api_manager.py       # Python script to manage microservices via Kubernetes API  
│── microservice.yaml        # Kubernetes Deployment & Service configuration  
│── README.md                # Project documentation  
│── .gitignore               # Git ignore file  
```
---

## Installation & Usage  

### 1. Clone the Repository  
```bash
git clone <repo url>
cd k8s-api-microservices  

2. Install Dependencies
Ensure you have Python installed, then run:
pip install kubernetes flask  

3. Build and Load the Microservice Image into Minikube
Before deploying to Kubernetes, we need to build and load the Docker image into Minikube.

minikube start --driver=docker  
eval $(minikube -p minikube docker-env)  # For Linux/macOS  
minikube -p minikube docker-env | Invoke-Expression  # For Windows PowerShell  

docker build -t my-microservice .  
minikube image load my-microservice  

4. Deploy the Microservice in Kubernetes
Apply the Kubernetes Deployment and Service configuration:
kubectl apply -f microservice.yaml  

Check the running pods:
kubectl get pods

Retrieve the service URL:
minikube service microservice-service --url  
Open the displayed URL in a browser to verify the microservice is running.

Using the Kubernetes API Manager Script
This Python script interacts with the Kubernetes API to manage microservices programmatically.

Run the script:
python k8s_api_manager.py  

The script will:
List all running microservices
Start a new microservice
Retrieve microservice details
Scale up/down a microservice
Stop and remove a microservice

--- 
License
This project is open-source and available under the MIT License.