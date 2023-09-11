#!/bin/bash
#
if [ ! -d "./neovim" ]; then
  # if neovim does not exist clone it and install it
  git clone https://github.com/neovim/neovim.git
  bash ./install-neovim-head.sh
fi

# npm packages
npm i --location=global eslint_d
npm i --location=global dockerfile-language-server-nodejs

# homebrew packages
brew install ripgrep
brew install yaml-language-server
brew info stylua
brew info luarocks
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
pip install codespell

# java setup - https://sookocheff.com/post/vim/neovim-java-ide/
ECLIPSE_DIR="$HOME/.local/share/eclipse"

if [ ! -d "$ECLIPSE_DIR" ]; then
  mkdir -p "$ECLIPSE_DIR"
fi

curl -o "$ECLIPSE_DIR/eclipse-java-google-style.xml" https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
