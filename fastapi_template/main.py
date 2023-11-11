from fastapi import FastAPI
from fastapi_template.routers import base


app = FastAPI(
    title="FastAPI Template",
    description="A boilerplate FastAPI app",
    version="1"
)
app.include_router(base.router)
