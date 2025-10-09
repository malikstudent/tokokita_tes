#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "❌ Usage: ./restore_db.sh <backup_file.sql>"
  exit 1
fi

docker exec -i tokokita_db psql -U user tokokita < "$1"

echo "✅ Database restored from $1"
