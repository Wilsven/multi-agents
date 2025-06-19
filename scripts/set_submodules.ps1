# Add the API repository into the src/api directory
git submodule add https://github.com/0Upjh80d/agents-api.git ./src/api

# Add the agent repository into the src/agent directory
git submodule add https://github.com/0Upjh80d/agents-openai.git ./src/agent

# Add the frontend repository into the src/frontend directory
git submodule add https://github.com/0Upjh80d/agents-frontend.git ./src/frontend

# Clone the orchestrator AND initialize/update submodules in one step
# git clone --recurse-submodules https://github.com/0Upjh80d/multi-agents.git
