FTP Microservice – Cloud Computing Project  

---

## Overview  
FTP Microservice is a lightweight and scalable file transfer solution running inside a Docker container. It provides an easy-to-use FTP server that allows users to upload and download files securely.  

### Key Features  
- Simple FTP server using `vsftpd`  
- Containerized deployment with Docker  
- Automated setup via `docker-compose.yml`  
- Persistent storage for uploaded files  
- Easily extendable for cloud environments  

---

## Technologies Used  

| Technology     | Purpose                           |
|---------------|----------------------------------|
| **Docker**    | Containerized deployment       |
| **Docker Compose** | Multi-container orchestration |
| **PowerShell** | Automation script (Windows)   |

---

Project Structure

```sh
ftp-microservice/
├── ftp-data/           # Directory for FTP files (mounted volume)
├── docker-compose.yml  # FTP service configuration
├── start.ps1           # PowerShell script for easy startup
├── .gitignore          # Excludes unnecessary files from Git
└── README.md           # Project documentation
```
---
Installation and Usage
1. Clone the Repository
git clone
cd ftp-microservice

2. Start the FTP Server
For Windows (PowerShell)
.\start.ps1

For Linux/macOS (without PowerShell script)
docker-compose up -d

3. Connect to FTP Server
You can connect using any FTP client (e.g., FileZilla, ftp command).
ftp 127.0.0.1

Credentials:

Username: testuser
Password: testpass

4. Upload and Download Files
Once connected, you can upload files to the ftp-data/ directory, which is mapped inside the container.
put example.txt   # Upload file
get example.txt   # Download file

License
This project is open-source and available under the MIT License.

Summary
Simple FTP microservice using Docker
Automated deployment with docker-compose
Persistent storage for files
Ready for cloud-based hosting
Open-source and extendable