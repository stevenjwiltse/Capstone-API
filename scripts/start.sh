pip install -r requirements.txt

export PYTHONPATH=/app

alembic upgrade head

cd src

uvicorn src.main:app --host 0.0.0.0 --port 8000