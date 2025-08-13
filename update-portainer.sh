#!/bin/bash
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR/portainer"

echo "==> Pulling Portainer image..."
docker compose pull

echo "==> Recreating Portainer containers..."
docker compose up -d

echo "==> Cleaning up unused images/containers/networks (no volumes)…"
docker system prune -af

echo "✅ Portainer updated and cleanup done."
