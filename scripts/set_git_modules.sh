#!/usr/bin/env bash

# Add the API repository into the src/api directory
git submodule add https://github.com/Wilsven/multi-agents-api.git ./src/api

# Add the agent repository into the src/agent directory
git submodule add https://github.com/Wilsven/multi-agents-agent.git ./src/agent

# Add the frontend repository into the src/frontend directory
git submodule add https://github.com/Wilsven/multi-agents-frontend.git ./src/frontend