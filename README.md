# Flask CI/CD Project

A small Flask application organized for local development, Docker, and CI checks.

## Project Structure

- `app/` contains the Flask application package.
- `tests/` contains unit tests for the Flask routes.
- `.github/workflows/ci-cd.yml` runs tests and builds the Docker image.
- `Dockerfile`, `docker-compose.yml`, and `deploy.sh` support local/container deployment.

## Run Locally

Prerequisite on Debian/Ubuntu systems:

```bash
sudo apt install python3-venv
```

Then run:

```bash
chmod +x start.sh
./start.sh
```

Open `http://127.0.0.1:5000/` and `http://127.0.0.1:5000/health`.

If you prefer manual setup, use `python3` instead of `python` on this system:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python run.py
```

If you do not want to install `python3-venv`, use Docker instead:

```bash
docker build -t flask-cicd-project .
docker run -p 5000:5000 flask-cicd-project
```

## Run Tests

```bash
pytest
```

## Run with Docker

```bash
docker build -t flask-cicd-project .
docker run -p 5000:5000 flask-cicd-project
```