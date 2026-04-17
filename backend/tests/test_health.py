from fastapi.testclient import TestClient
from sqlalchemy import text
from main import app
from database import engine

client = TestClient(app)


def test_health_endpoint():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "Improvly up!"}


def test_database_is_reachable():
    with engine.connect() as connection:
        result = connection.execute(text("SELECT 1"))
        assert result.scalar() == 1
