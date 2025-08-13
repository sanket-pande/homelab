#!/bin/bash
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"

#####################################
# Update Homelab stack (root compose)
#####################################
echo "==> Pulling images for homelab stack..."
cd "$DIR"
docker compose pull

echo "==> Recreating homelab containers..."
docker compose up -d

#####################################
# Update Portainer Agent stack
#####################################
echo "==> Pulling Portainer Agent image..."
cd "$DIR/portainer_agent"
docker compose pull

echo "==> Recreating Portainer Agent containers..."
docker compose up -d

#####################################
# Cleanup
#####################################
echo "==> Cleaning up unused images/containers/networks (no volumes)…"
docker system prune -af

echo "✅ All stacks updated and cleanup done."
