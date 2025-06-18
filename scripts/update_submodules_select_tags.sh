#!/bin/bash
# filepath: c:\Users\Leon\Documents\GitHub\multi-agents-org\multi-agents\scripts\update_submodules_select_tags.sh

# Set error handling
set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

echo -e "${CYAN}🏷️  Interactive Submodule Tag Selection${NC}"
echo -e "${CYAN}======================================${NC}"

# Define submodules (path:name pairs)
declare -A submodules=(
    ["src/api"]="API"
    ["src/agent"]="Agent"
    ["src/frontend"]="Frontend"
)

# Function to select tag for a submodule
select_tag_for_submodule() {
    local submodule_path="$1"
    local submodule_name="$2"
    
    echo ""
    echo -e "${YELLOW}📂 Processing $submodule_name ($submodule_path)${NC}"
    echo -e "${YELLOW}----------------------------------------${NC}"
    
    if [ ! -d "$submodule_path" ]; then
        echo -e "${RED}❌ Submodule directory $submodule_path not found${NC}"
        return 1
    fi
    
    # Change to submodule directory
    pushd "$submodule_path" > /dev/null
    
    # Fetch latest tags
    echo -e "${BLUE}🔄 Fetching tags...${NC}"
    git fetch --tags
    
    # Get available tags (last 10, sorted by version)
    echo -e "${GREEN}📋 Available tags:${NC}"
    mapfile -t tags < <(git tag -l --sort=-version:refname | head -10)
    
    if [ ${#tags[@]} -eq 0 ]; then
        echo -e "${RED}❌ No tags found for $submodule_name${NC}"
        popd > /dev/null
        return 1
    fi
    
    # Display tags with numbers
    for i in "${!tags[@]}"; do
        echo -e "${WHITE}  $((i + 1)). ${tags[i]}${NC}"
    done
    
    # Get user selection
    local valid_choice=false
    local selected_tag=""
    
    while [ "$valid_choice" = false ]; do
        echo ""
        read -p "🎯 Select tag for $submodule_name (1-${#tags[@]}) or 'latest' for most recent: " choice
        
        if [ "$choice" = "latest" ]; then
            selected_tag="${tags[0]}"
            valid_choice=true
        elif [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#tags[@]} ]; then
            selected_tag="${tags[$((choice - 1))]}"
            valid_choice=true
        else
            echo -e "${RED}❌ Invalid selection. Please enter a number between 1 and ${#tags[@]} or 'latest'${NC}"
        fi
    done
    
    # Checkout selected tag
    echo -e "${BLUE}🔄 Checking out $selected_tag...${NC}"
    if git checkout "$selected_tag"; then
        echo -e "${GREEN}✅ Successfully updated $submodule_name to $selected_tag${NC}"
        popd > /dev/null
        return 0
    else
        echo -e "${RED}❌ Failed to checkout $selected_tag for $submodule_name${NC}"
        popd > /dev/null
        return 1
    fi
}

# Main execution
echo -e "${CYAN}🚀 Starting interactive submodule tag selection...${NC}"

# Process each submodule
for submodule_path in "${!submodules[@]}"; do
    submodule_name="${submodules[$submodule_path]}"
    select_tag_for_submodule "$submodule_path" "$submodule_name"
done

echo ""
echo -e "${GREEN}🎉 Submodule tag selection completed!${NC}"
echo ""
echo -e "${CYAN}📋 Current submodule status:${NC}"
git submodule status
