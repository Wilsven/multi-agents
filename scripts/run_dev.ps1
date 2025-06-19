#!/usr/bin/env bash

echo "🚀 Starting development stack..."

# Ensure submodules are up to date
./scripts/update_remote_submodules.ps1

# Run with development overrides
docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build --remove-orphans
