#!/usr/bin/env bash
set -e

echo "Waiting for Postgres at $DB_HOST:$DB_PORT..."
python - <<'PY'
import os, time, socket
h=os.environ.get("DB_HOST","db"); p=int(os.environ.get("DB_PORT","5432"))
for _ in range(60):
    try:
        s=socket.create_connection((h,p),2); s.close(); break
    except Exception:
        time.sleep(1)
PY

echo "Creating PostGIS extension if needed..."
psql "postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${DB_HOST}:${DB_PORT}/${POSTGRES_DB}" \
  -c "CREATE EXTENSION IF NOT EXISTS postgis;"

echo "Applying migrations..."
python manage.py migrate

echo "Starting Django..."
python manage.py runserver 0.0.0.0:8000
