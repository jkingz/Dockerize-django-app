#!/bin/bash
set -e

# Run migrations
echo "Running migrations..."
python /app/manage.py makemigrations
python /app/manage.py migrate

# Collect static files
echo "Collecting static files..."
python /app/manage.py collectstatic --noinput

#superuser creation
echo "Creating superuser..."
python /app/manage.py createsuperuser --noinput \
  --username=${DJANGO_SUPERUSER_USERNAME} \
  --email=${DJANGO_SUPERUSER_EMAIL} || true

# Start server
echo "Starting server..."
exec python /app/manage.py runserver 0.0.0.0:8000
