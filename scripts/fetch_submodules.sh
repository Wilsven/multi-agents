#!/usr/bin/env bash

# This command checks out the specific commit hash that is recorded in the main repository's index for each submodule. 
# It does not automatically pull the latest changes from the submodule's remote repository. 
# This ensures that azd up deploys the exact version of the submodule code that the main repository is configured to use, leading to reproducible deployments.
git submodule update --init --recursive
    