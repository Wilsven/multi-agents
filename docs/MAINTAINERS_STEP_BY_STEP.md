# Maintainers Step-by-Step Guide

This guide provides comprehensive instructions for project maintainers covering deployment, maintenance, troubleshooting, and advanced workflows for the Multi-Agents application.

## Deployment

**Prerequisites for deployment:**

- Ensure weekly release PRs (`staging` → `main`) have been successfully merged in all relevant submodule repositories (`agents-api`, `agents-openai`, `agents-frontend`)
- All component teams have completed their tagging process

**Executor:** Administrator or designated release manager
**Timing:** After all submodule releases are complete for the week

### Step 1: Navigate to Main Repository

```bash
cd /path/to/agents
```

### Step 2: Checkout Target Branch

```bash
git checkout main
```

### Step 3: Ensure Main Repository is Up-to-Date

```bash
git pull origin main
```

### Step 4: Update Submodule Pointers

```bash
git submodule update --remote --init --recursive
# --remote: Fetches latest from submodule's remote tracked branch
# --init: Initializes any new submodules if necessary
# --recursive: Handles nested submodules (if any)
```

<!-- TODO: ensure versioning of the main commmits before updating the submodule (tags) -->

Alternatively, you can use our provided scripts:

```bash
# For updating to latest remote versions
./scripts/update_remote_submodules.sh

# Or on Windows
./scripts/update_remote_submodules.ps1
```

> [!NOTE]
> This assumes submodules in `.gitmodules` are configured to track the `main` branch. If they track `staging` or another branch, this command updates to the latest of that branch. Ensure they track `main` if that's your release branch.

### Step 5: Check Status

```bash
git status
```

Expected output:

```bash
On branch main
Your branch is up to date with 'origin/main'.
Changes not staged for commit:
  modified: multi-agents-api (new commits)
  modified: multi-agents-agents (new commits)
  modified: multi-agents-frontend (new commits)

no changes added to commit (use "git add" and/or "git commit -a")
```

<!-- TODO change it into src/api... -->

### Step 6: Stage the Updates

```bash
git add src/api src/agent src/frontend
```

### Step 7: Commit the Updates

```bash
git commit -m "chore(release): update submodules to latest main branch commits"
```

### Step 8: Push the Main Repository

```bash
git push origin main
```

### Step 9: Update Local Submodules to Committed Versions

```bash
# For updating to committed versions (local)
./scripts/update_local_submodules.sh

# Or on Windows
./scripts/update_local_submodules.ps1
```

<!-- add it as a first step to update localTODO add a section for local update -->

### Step 10: Tag the Main Repository (Optional but Recommended)

```bash
# For semantic versioning
git tag app-v1.5.0
git push origin app-v1.5.0
```

### Step 11: Deploy to Azure

```bash
azd up
```

> [!IMPORTANT]
>
> **ALWAYS** use LATEST VERSIONED TAGGED submodules for production deployments. Never use branch references or untagged commits in production environments.
