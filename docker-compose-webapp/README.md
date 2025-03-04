# Flask & PostgreSQL Web App - Cloud Computing Project

**Author:** paganinicaprice
**Project Goal:** Develop a cloud-based web application using Flask, PostgreSQL, and Docker Compose.

---

## **Overview**
This project is a cloud-ready web application built with Flask and PostgreSQL.  
It provides a REST API for managing items stored in a PostgreSQL database.  
The application is containerized using Docker and managed with Docker Compose.

### **Key Features**
- REST API for managing items
- Fully containerized using Docker and Docker Compose
- Secure environment variables for database credentials
- Persistent database storage with Docker volumes

---

## **Technologies Used**

| Technology    | Purpose                    |
|--------------|----------------------------|
| Python 3.9   | Programming language       |
| Flask        | Web framework              |
| PostgreSQL   | Relational database        |
| SQLAlchemy   | ORM for database handling  |
| Docker       | Containerization           |
| Docker Compose | Multi-container management |
| GitHub       | Version control            |

---

## Project Structure

flask-postgres-app/
├── app/                    # Flask application code
│   ├── app.py              # Main Flask app
│   ├── requirements.txt    # Python dependencies
├── .env                    # Environment variables (excluded from Git)
├── .gitignore              # Ignore unnecessary files
├── Dockerfile              # Docker build configuration
├── docker-compose.yml      # Multi-container setup
└── README.md               # Project documentation


---

## **How to Install and Run Locally**

### **1. Clone the repository**
```sh
git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
cd YOUR-REPOSITORY

2. Create an .env file
Before starting the project, create a .env file in the root directory:
POSTGRES_USER=user
POSTGRES_PASSWORD=password
POSTGRES_DB=mydatabase

3. Build and run the project
Run the following command to start the application:
docker-compose up --build

The application will start on http://localhost:5000.

Running with Docker
1. Build the Docker image
docker build -t flask-postgres-app .

2. Run the container
docker run -p 5000:5000 --env-file .env flask-postgres-app

3. Check API in the browser
http://127.0.0.1:5000/items

Database Access (PostgreSQL)
If you want to manually access the PostgreSQL database inside the Docker container:

Open a terminal and run:
docker exec -it docker-compose-webapp-db-1 psql -U user -d mydatabase

License
This project is open-source and available under the MIT License.