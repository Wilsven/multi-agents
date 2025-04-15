Write-Host "🚀 Ensuring Git submodules are initialized and updated to the committed state..."

# This command checks out the specific commit hash that is recorded in the main repository's index for each submodule. 
# It does not automatically pull the latest changes from the submodule's remote repository. 
# This ensures that azd up deploys the exact version of the submodule code that the main repository is configured to use, leading to reproducible deployments.
# --init: Initializes any submodules that haven't been initialized yet (e.g., after a fresh clone where --recurse-submodules wasn't used).
# --recursive: Ensures that any nested submodules (submodules within your submodules) are also updated.
git submodule update --init --recursive
    
Write-Host "✅ Submodule update complete."