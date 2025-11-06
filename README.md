# Spring Docker Nexus Stack
**Designed and Developed by: sak_shetty**
> Spring Boot application with MySQL and Nexus, deployed via Docker Compose and managed with a Jenkins pipeline.  
> Designed and Developed by sak_shetty for automated build, deploy, and cleanup.
---
## Overview

- This repository contains a full-stack deployment setup for a Spring Boot application using Docker Compose and Jenkins.  
It includes MySQL as the database, Nexus as the artifact repository, and a multi-stage Dockerfile for building and deploying the Spring Boot application.  
All services communicate via a dedicated Docker bridge network, and the pipeline allows you to deploy or remove the entire stack with ease.
---
## Features
- Multi-stage Dockerfile for Spring Boot app with Maven build and Nexus deployment.
- Docker Compose setup for:
  - Spring Boot Application (`spring_app_sak`)
  - MySQL 8.0 Database (`myapplication`)
  - Nexus Repository Manager
- Jenkins pipeline to:
  - Deploy or remove containers using Docker Compose.
  - Clean up all images, volumes, and orphan containers.
- Parameterized deployment via Jenkins choice (`Deploy` or `Remove`).
---
## System Requirements
### Hardware
- **CPU:** Minimum 2 CPUs (recommended 4 CPUs for heavy workloads)
- **RAM:** Minimum 4 GB (recommended 8 GB)
- **Storage:** Minimum 25 GB free

### Software
- **OS:** Ubuntu 24.04 LTS
- **Docker:** >= *.*
- **Docker Compose:** >= *.*
- **Jenkins:** Latest LTS version recommended
- **Git:** For version control
- **Java:** OpenJDK 17 (used in Dockerfile runtime)
---
## admin login

- username: admin
- password: admin

### install docker-compose

 ### To execute 
 ```bash
docker-compose up -d --build
```

### To delete
```bash
docker-compose down
```
 
### install mysql on amazonlinux 2

```bash
sudo yum update -y
sudo yum install -y mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation 
sudo systemctl status mariadb
```
```bash
# Update the MySQL configuration file to allow remote connections
vi /etc/my.cnf

# add these line to my.cnf
bind-address=0.0.0.0
```
```bash
# Restart MariaDB service to apply changes
sudo systemctl restart mariadb

echo "MySQL configuration updated to allow remote connections and MariaDB service restarted."
```
---
### to give Grant access
```bash
mysql -u root -p
```
```bash
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '1234' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```
---
