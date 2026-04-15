# Flask CI/CD Project

This is a small Flask application with a styled home page, a health check route, Docker support, and a GitHub Actions deployment workflow for EC2.

## Features

- Flask app with template-based UI
- Reusable base layout in `app/templates/base.html`
- Static styling in `app/static/css/style.css`
- Health endpoint at `/health`
- Dockerized deployment
- CI/CD workflow in `.github/workflows/ci-cd.yml`

## Project Structure

```text
Flasks-Devops-Project/
├── app/
│   ├── __init__.py
│   ├── models.py
│   ├── routes.py
│   ├── static/
│   │   └── css/
│   │       └── style.css
│   └── templates/
│       ├── base.html
│       └── index.html
├── tests/
│   └── test_app.py
├── Dockerfile
├── docker-compose.yml
├── deploy.sh
├── ec2-setup.sh
├── run.py
├── start.sh
└── .github/workflows/ci-cd.yml
```

## Local Setup

### Option 1: Virtual environment

On Debian or Ubuntu:

```bash
sudo apt install python3-venv
chmod +x start.sh
./start.sh
```

Then open:

- `http://127.0.0.1:5000/`
- `http://127.0.0.1:5000/health`

### Option 2: Manual Python setup

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python run.py
```

## Run Tests

```bash
pytest
```

## Docker

Build and run the app with Docker:

```bash
docker build -t flask-cicd-project .
docker run -p 5000:5000 flask-cicd-project
```

## CI/CD Deployment

The GitHub Actions workflow deploys the app to an EC2 instance using `appleboy/ssh-action`.

Before the workflow can deploy successfully, the EC2 instance should have:

- Docker installed and running
- Git installed
- The repository cloned at `~/Flasks-Devops-Project`
- The GitHub secret `EC2_SSH_KEY` configured
- The GitHub secret `EC2_HOST` configured

If the repository is not present on EC2, clone it manually first:

```bash
cd /home/ubuntu
git clone https://github.com/<your-username>/Flasks-Devops-Project.git
```

## EC2 Setup Script

You can use `ec2-setup.sh` to prepare the instance with Docker and Git.

```bash
bash ec2-setup.sh
```

## Notes

- The main page is rendered from `app/templates/index.html`.
- Shared page layout lives in `app/templates/base.html`.
- Static assets are served from `app/static/`.