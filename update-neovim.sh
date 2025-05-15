#!/bin/bash
set -e

# Script to manage Neovim updates using Homebrew
# This script allows you to update, pin, and rollback Neovim versions

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to show current Neovim version
show_version() {
  echo -e "${GREEN}Current Neovim version:${NC}"
  nvim --version | head -n 1
}

# Function to update Neovim
update_neovim() {
  echo -e "${YELLOW}Updating Neovim to latest stable version...${NC}"
  
  # Check if Neovim is installed via Homebrew
  if ! brew list neovim &>/dev/null; then
    echo -e "${YELLOW}Installing Neovim with Homebrew...${NC}"
    brew install neovim
  else
    # Unpin if pinned
    if brew list --pinned | grep -q neovim; then
      echo -e "${YELLOW}Unpinning Neovim...${NC}"
      brew unpin neovim
    fi
    
    # Update to latest stable
    echo -e "${YELLOW}Upgrading Neovim to latest stable version...${NC}"
    brew upgrade neovim
  fi
  
  # Pin the version to prevent automatic updates
  echo -e "${YELLOW}Pinning Neovim version...${NC}"
  brew pin neovim
  
  echo -e "${GREEN}Neovim updated successfully!${NC}"
  show_version
}

# Function to rollback Neovim
rollback_neovim() {
  echo -e "${YELLOW}Rolling back Neovim...${NC}"
  
  # Check if we have a previous version to roll back to
  if ! brew list neovim &>/dev/null; then
    echo -e "${RED}Neovim is not installed via Homebrew. Cannot rollback.${NC}"
    exit 1
  fi
  
  # Show available versions
  echo -e "${YELLOW}Available versions:${NC}"
  brew info --json=v2 neovim | jq -r '.formulae[0].installed[] | .version'
  
  # Ask which version to roll back to
  echo -e "${YELLOW}Enter the version to roll back to (or press Enter to cancel):${NC}"
  read -r version
  
  if [ -z "$version" ]; then
    echo -e "${YELLOW}Rollback cancelled.${NC}"
    exit 0
  fi
  
  # Unpin if pinned
  if brew list --pinned | grep -q neovim; then
    brew unpin neovim
  fi
  
  # Switch to the specified version
  echo -e "${YELLOW}Rolling back to version $version...${NC}"
  brew switch neovim "$version"
  
  # Pin the version
  brew pin neovim
  
  echo -e "${GREEN}Neovim rolled back successfully!${NC}"
  show_version
}

# Main menu
case "$1" in
  update)
    update_neovim
    ;;
  rollback)
    rollback_neovim
    ;;
  version)
    show_version
    ;;
  *)
    echo -e "${GREEN}Neovim Update Manager${NC}"
    echo -e "Usage: $0 [command]"
    echo -e ""
    echo -e "Commands:"
    echo -e "  ${YELLOW}update${NC}    Update Neovim to the latest stable version"
    echo -e "  ${YELLOW}rollback${NC}  Roll back to a previous version"
    echo -e "  ${YELLOW}version${NC}   Show current Neovim version"
    ;;
esac

exit 0
