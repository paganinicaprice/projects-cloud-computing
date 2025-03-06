# DevOps Ansible - Nginx Automation

## Overview
This project automates the installation and configuration of **Nginx** using **Ansible**.  
It is designed to run locally on **WSL (Ubuntu)** and can be extended for remote deployments on cloud servers.

---

## Technologies Used
- **Ansible** - Infrastructure automation
- **Nginx** - Web server
- **Ubuntu (WSL2)** - Operating system for testing
- **YAML** - Configuration files
- **Git** - Version control
- **Bash** - Command-line scripting

---

## Project Structure
```sh
devops-ansible/
│── inventory              # Inventory file (optional)
│── ansible.cfg            # Ansible configuration (optional)
│── playbook.yml           # Main playbook
│── roles/                 # Roles directory
│   ├── nginx/             # Nginx role
│   │   ├── tasks/         # Tasks for the role
│   │   │   ├── main.yml
│   │   ├── templates/     # Configuration files (templates)
│   │   │   ├── nginx.conf.j2
│   │   ├── handlers/      # Handlers (e.g., restart service)
│   │   │   ├── main.yml
│── .gitignore             # Excluded files from Git
│── README.md              # Project documentation
```

---

Installation Guide

1. Prerequisites
Ensure the following software is installed:

Windows 10/11 with WSL2 enabled
Ubuntu (WSL2) installed
Ansible installed in WSL

To install Ansible in WSL2:
sudo apt update && sudo apt upgrade -y
sudo apt install ansible -y

2. Clone the Repository

3. Run the Ansible Playbook
ansible-playbook -i inventory playbook.yml -K

4. Verify the Installation
Check if Nginx is running:
systemctl status nginx

Test in your browser:
http://localhost
Expected output:
"Welcome to Nginx on Ansible!"

License
This project is open-source under the MIT License.