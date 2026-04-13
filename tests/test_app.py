from app import create_app


def test_home_route():
    app = create_app({"TESTING": True})

    with app.test_client() as client:
        response = client.get("/")

    assert response.status_code == 200
    assert b"CI/CD Working Automatically" in response.data


def test_health_route():
    app = create_app({"TESTING": True})

    with app.test_client() as client:
        response = client.get("/health")

    assert response.status_code == 200
    assert response.get_json() == {"status": "UP"}