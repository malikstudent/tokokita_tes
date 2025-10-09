#!/bin/bash
set -e

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="backup_tokokita_${DATE}.sql"

docker exec -t tokokita_db pg_dump -U user tokokita > ~/backups/$BACKUP_FILE

echo "✅ Backup saved: ~/backups/$BACKUP_FILE"
