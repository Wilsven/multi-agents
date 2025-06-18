Write-Host "🚀 Ensuring Git submodules are initialized and updated to the latest remote state..."

# Pull latest commit for all submodules from their remotes tracked by the orchestrator's main branch.
# --init: Initializes any submodules that haven't been initialized yet (e.g., after a fresh clone where --recurse-submodules wasn't used).
# --recursive: Ensures that any nested submodules (submodules within your submodules) are also updated.
git submodule update --remote --init --recursive

Write-Host "✅ Submodule update complete."
