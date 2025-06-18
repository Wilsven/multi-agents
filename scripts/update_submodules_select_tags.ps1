# Set error handling
$ErrorActionPreference = "Stop"

Write-Host "🏷️  Interactive Submodule Tag Selection" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

# Define submodules
$submodules = @{
    "src/api" = "API"
    "src/agent" = "Agent"
    "src/frontend" = "Frontend"
}

# Function to select tag for a submodule
function Select-TagForSubmodule {
    param(
        [string]$SubmodulePath,
        [string]$SubmoduleName
    )
    
    Write-Host ""
    Write-Host "📂 Processing $SubmoduleName ($SubmodulePath)" -ForegroundColor Yellow
    Write-Host "----------------------------------------" -ForegroundColor Yellow
    
    if (-not (Test-Path $SubmodulePath)) {
        Write-Host "❌ Submodule directory $SubmodulePath not found" -ForegroundColor Red
        return $false
    }
    
    # Change to submodule directory
    Push-Location $SubmodulePath
    
    try {
        # Fetch latest tags
        Write-Host "🔄 Fetching tags..." -ForegroundColor Blue
        git fetch --tags
        
        # Get available tags (last 10, sorted by version)
        Write-Host "📋 Available tags:" -ForegroundColor Green
        $tags = git tag -l --sort=-version:refname | Select-Object -First 10
        
        if (-not $tags) {
            Write-Host "❌ No tags found for $SubmoduleName" -ForegroundColor Red
            return $false
        }
        
        # Convert to array if single item
        if ($tags -is [string]) {
            $tags = @($tags)
        }
        
        # Display tags with numbers
        for ($i = 0; $i -lt $tags.Count; $i++) {
            Write-Host "  $($i + 1). $($tags[$i])" -ForegroundColor White
        }
        
        # Get user selection
        do {
            Write-Host ""
            $choice = Read-Host "🎯 Select tag for $SubmoduleName (1-$($tags.Count)) or 'latest' for most recent"
            
            if ($choice -eq "latest") {
                $selectedTag = $tags[0]
                $validChoice = $true
            }
            elseif ($choice -match '^\d+$' -and [int]$choice -ge 1 -and [int]$choice -le $tags.Count) {
                $selectedTag = $tags[[int]$choice - 1]
                $validChoice = $true
            }
            else {
                Write-Host "❌ Invalid selection. Please enter a number between 1 and $($tags.Count) or 'latest'" -ForegroundColor Red
                $validChoice = $false
            }
        } while (-not $validChoice)
        
        # Checkout selected tag
        Write-Host "🔄 Checking out $selectedTag..." -ForegroundColor Blue
        git checkout $selectedTag
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Successfully updated $SubmoduleName to $selectedTag" -ForegroundColor Green
            return $true
        }
        else {
            Write-Host "❌ Failed to checkout $selectedTag for $SubmoduleName" -ForegroundColor Red
            return $false
        }
    }
    finally {
        # Return to original directory
        Pop-Location
    }
}

# Main execution
Write-Host "🚀 Starting interactive submodule tag selection..." -ForegroundColor Cyan

# Process each submodule
foreach ($submodulePath in $submodules.Keys) {
    $submoduleName = $submodules[$submodulePath]
    Select-TagForSubmodule -SubmodulePath $submodulePath -SubmoduleName $submoduleName
}

Write-Host ""
Write-Host "🎉 Submodule tag selection completed!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Current submodule status:" -ForegroundColor Cyan
git submodule status
