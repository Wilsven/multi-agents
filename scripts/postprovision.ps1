# Exit immediately if any command fails
$ErrorActionPreference = "Stop"

Write-Host "🚀 Running postprovision.sh..."

./scripts/test.sh

./scripts/rolesgroup.sh
