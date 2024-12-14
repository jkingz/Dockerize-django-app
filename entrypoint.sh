#!/bin/sh
set -e

# Functions
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

wait_for_db() {
    log "Waiting for database..."
    python <<END
import sys
import time
import psycopg2
while True:
    try:
        psycopg2.connect(
            dbname="${POSTGRES_DB}",
            user="${POSTGRES_USER}",
            password="${POSTGRES_PASSWORD}",
            host="${POSTGRES_HOST}",
            port="${POSTGRES_PORT:-5432}"
        )
        break
    except psycopg2.OperationalError:
        sys.stdout.write(".")
        sys.stdout.flush()
        time.sleep(1)
END
    log "Database is ready!"
}

# Check superuser credentials only for web service
if [ "$SERVICE_NAME" = "app" ]; then
    if [ -z "$DJANGO_SUPERUSER_EMAIL" ] || [ -z "$DJANGO_SUPERUSER_PASSWORD" ]; then
        log "Error: DJANGO_SUPERUSER_EMAIL and DJANGO_SUPERUSER_PASSWORD must be set for web service"
        exit 1
    fi
fi

# Run migrations
log "Running migrations..."
python /app/manage.py migrate --noinput

# Collect static files
if [ "$DJANGO_COLLECT_STATIC" = "true" ]; then
    log "Collecting static files..."
    python /app/manage.py collectstatic --noinput --clear
fi

# Create superuser if this is the web container
if [ "$SERVICE_NAME" = "app" ]; then
    log "Creating superuser..."
    python /app/manage.py createsuperuser --noinput \
        --email=${DJANGO_SUPERUSER_EMAIL} \
        --first_name=${DJANGO_SUPERUSER_FIRST_NAME:-Admin} \
        --last_name=${DJANGO_SUPERUSER_LAST_NAME:-User} || true
fi

# Start server
log "Starting server..."
if [ "$DJANGO_ENV" = "production" ]; then
    exec gunicorn wsgi:application \
        --bind 0.0.0.0:${PORT:-8000} \
        --workers ${GUNICORN_WORKERS:-3} \
        --timeout ${GUNICORN_TIMEOUT:-60} \
        --access-logfile - \
        --error-logfile -
else
    exec python /app/manage.py runserver 0.0.0.0:${PORT:-8000}
fi
