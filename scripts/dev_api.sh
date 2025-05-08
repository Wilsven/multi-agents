#!/usr/bin/env bash

# Define the expected relative path to the sibling API repository
# Adjust 'api-repo' if your actual directory name is different (e.g., multi-agents-api)
EXPECTED_SIBLING_REPO="multi-agents-api"

echo "🚀 Starting development stack for API..."

echo "Ensuring 'multi-agents' and '$EXPECTED_SIBLING_REPO' repositories are sibling directories..."

# Go to the directory where this script lives, then up one level (multi-agents repo root).
# This ensures robustness no matter where the user was when they ran the script.
cd "$(dirname "$0")/.."

# Check if that path actually points to a directory
if [ ! -d "../$EXPECTED_SIBLING_REPO" ]; then
    echo "❌ Required sibling directory not found!"
    echo "   Expected to find '$EXPECTED_SIBLING_REPO' at this location."
    echo "   Please ensure your 'multi-agents' and '$EXPECTED_SIBLING_REPO' repository clones are located side-by-side in the same parent directory."
    # Exit the script with a failure code 
    exit 1
fi

echo "✅ Sibling directory '$EXPECTED_SIBLING_REPO' found."

echo "🚀 Starting development stack for API..."

# Run docker compose using the base file and the API dev override
docker compose -f docker-compose.yml -f docker-compose.dev.api.yml up --build --remove-orphans
