import pytest
from fastapi.testclient import TestClient
from fastapi_template import app


@pytest.fixture
def test_client() -> TestClient:
    return TestClient(app)


def test_home(test_client):
    response = test_client.get("/")
    assert response.status_code == 200
    assert response.json() == {"status": "ok"}
