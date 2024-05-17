import uvicorn
from fastapi import FastAPI
from auth.router import router as router_auth
from fastapi.middleware.cors import CORSMiddleware
from pages.router import router as router_template


app = FastAPI(
    title = "Demo application"
)

origins = [
    "http://localhost.tiangolo.com",
    "https://localhost.tiangolo.com",
    "http://localhost",
    "http://localhost:8080",
]
# Middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
# Include router
app.include_router(router_auth)
app.include_router(router_template)

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
