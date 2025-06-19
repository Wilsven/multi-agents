#!/usr/bin/env bash

# Define the expected relative path to the sibling frontend repository
EXPECTED_SIBLING_REPO="agents-frontend"

echo "🚀 Starting development stack for Frontend..."

echo "Ensuring 'multi-agents' and '$EXPECTED_SIBLING_REPO' repositories are sibling directories..."

# Go to the directory where this script lives, then up one level (multi-agents repo root).
cd "$(dirname "$0")/.."

# Check if that path actually points to a directory
if [ ! -d "../$EXPECTED_SIBLING_REPO" ]; then
    echo "❌ Required sibling directory not found!"
    echo "   Expected to find '$EXPECTED_SIBLING_REPO' at this location."
    echo "   Please ensure your 'multi-agents' and '$EXPECTED_SIBLING_REPO' repository clones are located side-by-side in the same parent directory."
    exit 1
fi

echo "✅ Sibling directory '$EXPECTED_SIBLING_REPO' found."

echo "🚀 Starting development stack for Frontend..."

# Run docker compose using the base file and the Frontend dev override
docker compose -f docker-compose.yml -f docker-compose.dev.frontend.yml up --build --remove-orphans
