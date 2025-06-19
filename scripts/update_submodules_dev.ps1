# Update submodules to latest staging commits
# This script is used for development deployments

$ErrorActionPreference = "Stop"

Write-Host "🔄 Updating submodules to latest staging commits..." -ForegroundColor Cyan

# Array of submodule paths
$Submodules = @("src/api", "src/agent", "src/frontend")

foreach ($submodule in $Submodules) {
    if (Test-Path $submodule) {
        Write-Host "📁 Processing $submodule..." -ForegroundColor Yellow
        Push-Location $submodule

        try {
            # Fetch latest changes
            git fetch origin

            # Checkout staging branch
            git checkout staging

            # Pull latest changes
            git pull origin staging

            $commitHash = git rev-parse --short HEAD
            Write-Host "✅ $submodule updated to latest staging commit: $commitHash" -ForegroundColor Green
        }
        catch {
            Write-Host "❌ Error updating $submodule`: $_" -ForegroundColor Red
            Pop-Location
            exit 1
        }
        finally {
            Pop-Location
        }
    }
    else {
        Write-Host "⚠️  Warning: $submodule directory not found" -ForegroundColor Yellow
    }
}

Write-Host "🎉 All submodules updated to latest staging commits!" -ForegroundColor Green
