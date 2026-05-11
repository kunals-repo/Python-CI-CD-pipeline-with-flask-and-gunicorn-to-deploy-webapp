# Python CI/CD Pipeline Deployment on Azure Linux VM using GitHub Actions

## Project Overview

This project demonstrates a complete CI/CD pipeline for deploying a Python Flask application to an Azure Linux Virtual Machine


# CI/CD Workflow

## Continuous Integration (CI)

On every push/workflow_dipatch to the `main` branch:

* GitHub Actions workflow is triggered
  
* Python dependencies are installed

* Linting is performed using flake8

* Unit tests are executed using Pytest
  

## Continuous Deployment (CD)

After successful testing:

* GitHub Actions connects to Azure VM using SSH
  
* Application files are copied to VM using SCP
  
* Virtual environment is created
  
* Dependencies are installed

* Gunicorn server starts the Flask application

--------------------------------------------------------------

# Application Features

* Flask REST API
* Health check endpoint
* Addition API endpoint
* Automated testing
* Production deployment using Gunicorn

---

---------------------------------------------------------------------------------

# GitHub Actions Features Used

* Workflow automation
  
* Matrix strategy
  
* Dependency caching
  
* Secrets management
  
* Multi-stage pipeline
  
* SSH-based deployment

--------------------------------------------------------------------------------------

# Errors Faced & Resolution :

## Permission Denied Error in Virtual Environment

### Error

```bash
Permission denied: '/opt/python-app/venv/bin/pip'
```

### Cause

The application directory and virtual environment were created using `sudo`, which made the files owned by the `root` user.

### Resolution

* Changed ownership using:

```bash
sudo chown -R azureuser:azureuser /opt/python-app
```
NOTE :

We have make this changes inside azure VM. We run the above command with our username which is kunal. We dont modify the script code.

-------------------------------------------------------------------------------------

# Key Learnings

Through this project, I learned:

* GitHub Actions CI/CD pipeline creation
* Python application deployment automation
* Azure Linux VM management
* SSH-based deployment
* Linux permissions troubleshooting
* Gunicorn production server setup
* Python virtual environment management
* Automated testing and linting
* Production deployment practices

