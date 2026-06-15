from contextlib import asynccontextmanager

from fastapi import FastAPI
from sqlalchemy import text
from database import engine

@asynccontextmanager
def lifespan(app: FastAPI):
    with engine.connect() as connection:
        connection.execute(text("SELECT 1"))
    yield

app = FastAPI(lifespan=lifespan)

@app.get("/health")
def health():
    return {"status": "Improvly up!"}