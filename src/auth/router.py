from fastapi import APIRouter

router = APIRouter(
    prefix="/operations",
    tags=["Operation"]
)

@router.get("/long_operation")
def read_root():
    return {'Hello': 'World load balance app 1'}