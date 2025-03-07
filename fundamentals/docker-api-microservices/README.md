# Docker API Microservices Manager

---

## Overview
This project demonstrates how to manage microservices using **Docker API**. Instead of using the Docker CLI, the Python script communicates directly with Docker's **local API** to start, stop, and retrieve information about running containers.

The project includes:
- A simple **Flask microservice**
- A **Dockerfile** to containerize the service
- A **Python script that interacts with Docker API** via **named pipes (`npipe://`) on Windows** and **Unix socket (`unix:///var/run/docker.sock`) on Linux/WSL**

---

## Technologies & Dependencies
| Technology  | Purpose                          |
|------------|----------------------------------|
| **Docker**  | Containerization platform      |
| **Python 3.9+** | Programming language      |
| **Flask**  | Microservice framework          |
| **Docker SDK for Python (`docker` library)** | API communication |

---
```sh
docker-api-microservices/
│── app.py                  # Flask-based microservice
│── Dockerfile              # Dockerfile for building the microservice container
│── docker_api_manager.py   # Python script to manage microservices via Docker API
│── README.md               # Project documentation
```

## Installation & Usage

### 1. Clone the Repository
```sh
git clone 
cd docker-api-microservices

2. Install Dependencies
Ensure you have Python installed, then run:
pip install docker flask

3. Build and Run the Microservice
docker build -t my-microservice .
docker run -d -p 5000:5000 --name microservice my-microservice
Check if the service is running by opening: http://localhost:5000

4. Use the Docker API Manager Script
Run the Python script to interact with the Docker API:
python docker_api_manager.py

This script will:

List all running containers
Start a new microservice container
Retrieve container details
Stop and remove the container

---
License
This project is open-source and available under the MIT License.