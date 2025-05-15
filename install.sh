#!/bin/bash
set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Installing Neovim configuration...${NC}"

# Install Neovim using Homebrew
if ! command -v nvim &>/dev/null; then
  echo -e "${YELLOW}Installing Neovim with Homebrew...${NC}"
  brew install neovim
  brew pin neovim
else
  echo -e "${YELLOW}Neovim already installed.${NC}"
fi

# npm packages
echo -e "${YELLOW}Installing npm packages...${NC}"
npm i --location=global eslint_d
npm i --location=global dockerfile-language-server-nodejs

# homebrew packages
echo -e "${YELLOW}Installing Homebrew packages...${NC}"
brew install ripgrep
brew install yaml-language-server
brew install stylua
brew install luarocks
brew install hadolint
brew install shellcheck
brew install shfmt
brew install lua-language-server
brew install golangci-lint
brew install gopls
brew install jq
brew install cfn-lint
brew install flake8
brew install black

# pip packages
echo -e "${YELLOW}Installing pip packages...${NC}"
pip install codespell

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo -e "1. Open Neovim: ${GREEN}nvim${NC}"
echo -e "2. Run: ${GREEN}:Lazy${NC}"
echo -e "3. Install all plugins using the GUI that appears"
echo -e ""
echo -e "To update Neovim in the future, run: ${GREEN}./update-neovim.sh update${NC}"
