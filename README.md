<div align="center">
  <div>
    <img src="https://img.shields.io/badge/-Docker-blue?style=for-the-badge&logo=Docker&logoColor=white" alt="docker" />
    <img src="https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=green" alt="django" />
    <img src="https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54" alt="python" />
    <img src="https://img.shields.io/badge/postgresql-4169e1?style=for-the-badge&logo=postgresql&logoColor=white" alt="postgres" />
    <img src="https://img.shields.io/badge/Redis-DC382D?style=for-the-badge&logo=redis&logoColor=white" alt="redis" />
    <img src="https://img.shields.io/static/v1?style=for-the-badge&message=Celery&color=37814A&logo=Celery&logoColor=FFFFFF&label" alt="celery" />
  </div>

  <h3 align="center">  🎯 A Dockerize Python Django App  🎯</h3>
</div>

## 📋 <a name="table">Table of Contents</a>

1. 🚀 [Introduction](#introduction)
2. 🚀 [Tech Stack](#tech-stack)
3. 🔋 [Features](#features)
4. 🤸 [Quick Start](#quick-start)


![https://app.eraser.io/workspace/CFRU4D7w5QLjrbt6WUym](https://eraser.imgix.net/workspaces/CFRU4D7w5QLjrbt6WUym/LDNqz8zHGhSJCTKFJLMGzGpX3ru2/p6sLjCHeunnxHIKtNJTgu.png?ixlib=js-3.7.0)

## <a name="introduction">🤖 Introduction</a>

Dockerize Django project template

## <a name="tech-stack">⚙️ Tech Stack & Packages</a>

- Docker
- Python
- Django
- Postgres
- Redis
- Celery
- Celery-beat
- Flower

- check requirements.txt for python packages

## <a name="features">🔋 Features</a>

👉 **Docker-Django**: Docker Django docker compose with multiple serices

👉 **Celery**: Trigger tasks

👉 **Celery-beat**: Periodic tasks scheduler

👉 **Flower**: GUI for celery tasks

## <a name="quick-start">🤸 Quick Start</a>

Follow these steps to set up the project locally on your machine.

**Prerequisites**

Make sure you have the following installed on your machine:

- [Git](https://git-scm.com/)
- [Docker](https://docs.docker.com/get-started/)
- [Python](https://www.python.org/)
- [Pip](https://pypi.org/project/pip/)

**Cloning the Repository**

```bash
git clone git@github.com:jkingz/Dockerize-django-app.git new_proj_name
cd new_proj_name
```

**Installation**

Install the project dependencies using pip:

```bash
pip install -r requirements.txt --no-cache-dir
```

**Set Up Environment Variables**

- DJANGO_SUPERUSER_USERNAME=admin
- DJANGO_SUPERUSER_EMAIL=admin@example.com
- DJANGO_SUPERUSER_PASSWORD=adminpassword

**Running the Project**

```bash
docker compose build
docker compose up -d

# down the container
docker compose down
```

Open [http://localhost:8000](http://localhost:8000) in your browser to view the project.

<!--- Eraser file: https://app.eraser.io/workspace/CFRU4D7w5QLjrbt6WUym --->
