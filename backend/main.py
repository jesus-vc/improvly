from fastapi import FastAPI
from sqlalchemy import text
from database import engine

app = FastAPI()


@app.on_event("startup")
def verify_database_connection():
    with engine.connect() as connection:
        connection.execute(text("SELECT 1"))


@app.get("/health")
def health():
    return {"status": "Improvly up!"}

