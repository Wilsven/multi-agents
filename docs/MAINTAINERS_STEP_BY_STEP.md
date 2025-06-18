# Maintainers Step-by-Step Guide

This guide provides comprehensive instructions for project maintainers covering deployment, maintenance, troubleshooting, and advanced workflows for the Multi-Agents application.

## Deployment

This section covers two distinct deployment strategies:

- **Production Deployment**: Uses tagged releases from submodule repositories
- **Development Deployment**: Uses latest commits from staging branches

## Local Development Updates

### Update Local Submodules to Committed Versions

> [!NOTE]
> Before running the local development scripts, ensure your submodules are synchronized to the latest commits recorded in the main repository:

```bash
# For updating to committed versions (local)
./scripts/update_local_submodules.sh

# Or on Windows
./scripts/update_local_submodules.ps1
```

## Production Deployment (Main Environment)

**Prerequisites for production deployment:**

- Ensure weekly release PRs (`staging` → `main`) have been successfully merged in all relevant submodule repositories (`agents-api`, `agents-openai`, `agents-frontend`)
- All component teams have completed their tagging process with proper semantic versioning

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

### Step 4: Update Submodules to Latest Release Tags

**Select Specific Tags (Interactive)**

```bash
# For selecting specific tag versions per submodule
./scripts/update_submodules_select_tags.sh

# Or on Windows
./scripts/update_submodules_select_tags.ps1
```

### Step 5: Check Status

```bash
git status
```

Expected output:

```bash
On branch main
Your branch is up to date with 'origin/main'.
Changes not staged for commit:
  modified: src/api (new commits)
  modified: src/agent (new commits)
  modified: src/frontend (new commits)

no changes added to commit (use "git add" and/or "git commit -a")
```

### Step 6: Stage the Updates

```bash
git add src/api src/agent src/frontend
```

### Step 7: Commit the Updates

```bash
git commit -m "chore(release): update submodules to latest release tags"
```

### Step 8: Push the Main Repository

```bash
git push origin main
```

### Step 9: Tag the Main Repository

```bash
# For semantic versioning
git tag v0.1.1
git push origin v0.1.1
```

### Step 10: Deploy to Azure Production

```bash
azd up --environment agents
```

## Development Deployment (Dev Environment)

**Prerequisites for development deployment:**

- Latest commits are available on `staging` branches in all submodule repositories
- Development environment is ready for testing

**Executor:** Development team lead or designated developer
**Timing:** As needed for testing and development

### Step 1: Navigate to Main Repository

```bash
cd /path/to/agents
```

### Step 2: Checkout Development Branch

```bash
git checkout dev
# If dev branch doesn't exist, create it from main
# git checkout -b dev main
```

### Step 3: Ensure Development Branch is Up-to-Date

```bash
git pull origin dev
```

### Step 4: Update Submodules to Latest Staging Commits

```bash
# Update submodules to track staging branches and pull latest
git submodule foreach 'git checkout staging && git pull origin staging'
```

Alternatively, you can use our provided script for development deployments:

```bash
# For updating to latest staging commits
./scripts/update_submodules_to_staging.sh

# Or on Windows
./scripts/update_submodules_to_staging.ps1
```

### Step 5: Check Status

```bash
git status
```

### Step 6: Stage the Updates

```bash
git add src/api src/agent src/frontend
```

### Step 7: Commit the Updates

```bash
git commit -m "chore(dev): update submodules to latest staging commits"
```

### Step 8: Push the Development Branch

```bash
git push origin dev
```

### Step 9: Deploy to Azure Development

```bash
azd up --environment agents-development
```

> [!IMPORTANT]
>
> **Production Deployments**: ALWAYS use LATEST VERSIONED TAGGED submodules for production deployments. Never use branch references or untagged commits in production environments.
>
> **Development Deployments**: Use latest staging commits for development and testing purposes only.
