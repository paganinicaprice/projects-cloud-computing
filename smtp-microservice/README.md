SMTP Microservice - Cloud Computing Project

Author: paganinicaprice
Project Goal: Develop a cloud-based microservice for sending emails using FastAPI, Docker, and Kubernetes.

Overview:
SMTP Microservice is a cloud-ready web application built with FastAPI, designed to send emails using an SMTP server (e.g., Gmail).
The project is containerized using Docker and orchestrated with Kubernetes (Minikube).

Key Features:

REST API for sending emails
Dockerized for easy deployment
Secure environment variables for SMTP credentials
Kubernetes deployment with Minikube

Technologies Used:
Technology	Purpose
Python 3.9	Programming language
FastAPI		Web framework
Uvicorn		ASGI server
Docker		Containerization
Kubernetes (Minikube)	Container orchestration
GitHub		Version control

Example Email Request
Example JSON request body for sending an email:

json
{
  "recipient": "someone@example.com",
  "subject": "SMTP Microservice Test",
  "message": "Hello from the SMTP microservice!"
}


Project Structure:
smtp-microservice/
│── k8s/                    # Kubernetes configuration files
│   ├── deployment.yaml      # Defines Kubernetes Deployment
│   ├── service.yaml         # Service configuration (NodePort)
│   ├── secret.yaml          # SMTP secrets (Base64 encoded)
│── .gitignore               # Ignore unnecessary files
│── .env                     # Environment variables (excluded from Git)
│── Dockerfile               # Docker build configuration
│── main.py                  # FastAPI application code
│── requirements.txt          # Python dependencies
│── README.md                # Project documentation

How to Install and Run Locally

1️⃣ Clone the repository
git clone https://github.com/paganinicaprice/projects-cloud-computing.git
cd projects-cloud-computing/smtp-microservice

2️⃣ Set up a virtual environment
python -m venv venv
venv\Scripts\activate  # Windows
source venv/bin/activate  # Linux/Mac

3️⃣ Install dependencies
pip install -r requirements.txt

4️⃣ Run the FastAPI server
uvicorn main:app --host 0.0.0.0 --port 8000 --reload

5️⃣ Access API documentation
Open in browser: http://127.0.0.1:8000/docs

Running with Docker:

1️⃣ Build the Docker image
docker build -t smtp-microservice .

2️⃣ Run the container
docker run -p 8000:8000 --env-file .env smtp-microservice

3️⃣ Check API in the browser
http://127.0.0.1:8000/docs

Deploying to Kubernetes (Minikube):
1️⃣ Start Minikube
minikube start

2️⃣ Load Docker image into Minikube
minikube image load smtp-microservice

3️⃣ Deploy to Kubernetes
kubectl apply -f k8s/

4️⃣ Check pod status
kubectl get pods

5️⃣ Forward port for local access
kubectl port-forward svc/smtp-service 8080:80

6️⃣ Test API
👉 http://127.0.0.1:8080/docs


Sending an Email via API
Use Swagger UI or curl to send an email:
curl -X POST "http://127.0.0.1:8080/send-email" \
     -H "Content-Type: application/json" \
     -d '{"recipient": "someone@example.com", "subject": "SMTP Test", "message": "Hello from the microservice!"}'
If the email is sent successfully, the microservice is working! 


Summary
✔ Fully functional SMTP microservice using FastAPI
✔ Dockerized for easy deployment
✔ Kubernetes (Minikube) orchestration
✔ GitHub-hosted repository
