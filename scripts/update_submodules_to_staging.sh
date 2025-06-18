#!/bin/bash

# Update submodules to latest staging commits
# This script is used for development deployments

set -e

echo "🔄 Updating submodules to latest staging commits..."

# Array of submodule paths
SUBMODULES=("src/api" "src/agent" "src/frontend")

for submodule in "${SUBMODULES[@]}"; do
    if [ -d "$submodule" ]; then
        echo "📁 Processing $submodule..."
        cd "$submodule"
        
        # Fetch latest changes
        git fetch origin
        
        # Checkout staging branch
        git checkout staging
        
        # Pull latest changes
        git pull origin staging
        
        echo "✅ $submodule updated to latest staging commit: $(git rev-parse --short HEAD)"
        
        # Return to root directory
        cd - > /dev/null
    else
        echo "⚠️  Warning: $submodule directory not found"
    fi
done

echo "🎉 All submodules updated to latest staging commits!"
