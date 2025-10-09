#!/bin/bash
set -e

echo "🚀 Deploying Tokokita..."

git pull origin staging
docker compose -f docker-compose.staging.yml down
docker compose -f docker-compose.staging.yml up -d --build

echo "✅ Deployment complete!"
