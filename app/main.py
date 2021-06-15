from fastapi import FastAPI
from app.routers import base


app = FastAPI(
    title="FastAPI Template",
    description="A boilerplate FastAPI app",
    version="1"
)
app.include_router(base.router)
