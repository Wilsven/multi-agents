#!/usr/bin/env bash

echo "🚀 Starting full development stack (API + Agent + Frontend)..."

# Go to the directory where this script lives, then up one level
cd "$(dirname "$0")/.."

# Check for required sibling repositories
REQUIRED_REPOS=("agents-api" "agents-openai" "agents-frontend")

for repo in "${REQUIRED_REPOS[@]}"; do
    if [ ! -d "../$repo" ]; then
        echo "❌ Required sibling directory not found: $repo"
        echo "   Please ensure all repositories are cloned side-by-side."
        exit 1
    fi
done

echo "✅ All required sibling directories found."

# Run docker compose with development overrides
docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build --remove-orphans
