# Remove submodule directories from the index (but not disk)
git rm --cached src/api
git rm --cached src/agent
git rm --cached src/frontend

# Remove the directories from disk
Remove-Item -Recurse -Force .git/modules/src/api
Remove-Item -Recurse -Force .git/modules/src/agent
Remove-Item -Recurse -Force .git/modules/src/frontend

# Remove submodule entries from .git/config
git config --remove-section submodule.src/api 2>$null
git config --remove-section submodule.src/agent 2>$null
git config --remove-section submodule.src/frontend 2>$null

# Remove the .gitmodules file entries (or delete the entire file if only these submodules exist)
Remove-Item .gitmodules -ErrorAction SilentlyContinue

# Remove the actual submodule directories from working tree
Remove-Item -Recurse -Force src/api -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force src/agent -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force src/frontend -ErrorAction SilentlyContinue

# Commit the changes
# git add .gitmodules
# git commit -m "Remove all submodules"

Write-Host "Submodules removed. Run 'git submodule status' to verify."
