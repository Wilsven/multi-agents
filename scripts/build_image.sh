#!/usr/bin/env bash

set -e # Exit immediately if a command exits with a non-zero status.

# Define the path to the API submodule
API_SUBMODULE_DIR="./src/api"

if [ ! -d "$API_SUBMODULE_DIR" ]; then
  echo "❌ API submodule directory '$API_SUBMODULE_DIR' not found."
  echo "Ensure you are in the main repository root and the submodule is initialized."
  exit 1
fi

echo "🔧 Preparing data in '$API_SUBMODULE_DIR'..."

# Use a subshell to avoid changing the main script's directory
(
  # Navigate into the API submodule directory
  cd "$API_SUBMODULE_DIR" || exit 1 # Exit subshell if cd fails

  # Ensure scripts directory exists and scripts are executable
  if [ ! -d "scripts" ]; then
      echo "❌ 'scripts' directory not found inside '$API_SUBMODULE_DIR'."
      exit 1
  fi
  chmod +x scripts/* # Ensure executability

  echo "🚀 Running DVC setup script (./scripts/setup_dvc.sh)..."
  # Execute setup script. Assumes necessary host env vars or .env file are present.
  ./scripts/setup_dvc.sh
  if [ $? -ne 0 ]; then
      echo "❌ DVC setup script failed."
      exit 1 # Exit subshell on failure
  fi
  echo "✅ DVC setup complete."

  echo "🚀 Running data fetching script (./scripts/get_data.sh)..."
  # Execute data fetching script
  ./scripts/get_data.sh
  if [ $? -ne 0 ]; then
      echo "❌ Data fetching script failed."
      exit 1 # Exit subshell on failure
  fi
  echo "✅ Data fetching complete."
)
# Check the exit status of the subshell
if [ $? -ne 0 ]; then
    echo "❌ Data preparation steps failed within '$API_SUBMODULE_DIR'."
    exit 1
fi

echo "✅ Data preparation successful."

# # --- Build Docker Image ---
# echo "📦 Building API Docker image using 'docker compose'..."

# # Ensure BuildKit is used (usually default)
# export DOCKER_BUILDKIT=1

# # Run docker compose build for the api service
# # It will use the Dockerfile in API_SUBMODULE_DIR and copy the prepared data
# docker compose build api
# if [ $? -ne 0 ]; then
#     echo "❌ ERROR: Docker build failed for the 'api' service."
#     exit 1
# fi

# echo "✅ API Docker image build complete!"
