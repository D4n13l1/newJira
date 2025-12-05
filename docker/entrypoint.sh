#!/bin/bash
set -e

echo "Waiting for database..."
sleep 2

echo "Running migrations..."
alembic upgrade head || echo "Migration failed or already up to date"

echo "Starting application..."
exec uvicorn main:app --host ${HOST:-0.0.0.0} --port ${PORT:-8000} --reload