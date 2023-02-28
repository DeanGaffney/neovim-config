#!/bin/bash
#
if [ ! -d "./neovim" ]; then
  # if neovim does not exist clone it and install it
  git clone git@github.com:neovim/neovim.git
  bash ./install-neovim-head.sh
fi

npm list eslint_d --location=global || npm i --location=global eslint_d
npm list dockerfile-language-server-nodejs --location=global || npm i --location=global dockerfile-language-server-nodejs

brew info yaml-language-server || brew install yaml-language-server
brew info stylua || brew info stylua
brew info hadolint || brew install hadolint
brew info shellcheck || brew install shellcheck
brew info shfmt || brew install shfmt
brew info lua-language-server || brew install lua-language-server
brew info golangci-lint || brew install golangci-lint
brew info gopls || brew install gopls
brew info jq || brew install jq
brew info proselint || brew install proselint
brew info codespell || brew install codespell
brew info cfn-lint || brew install cfn-lint

# java setup - https://sookocheff.com/post/vim/neovim-java-ide/
ECLIPSE_DIR="$HOME/.local/share/eclipse"

if [ ! -d "$ECLIPSE_DIR" ]; then
  mkdir -p "$ECLIPSE_DIR"
fi

curl -o "$ECLIPSE_DIR/eclipse-java-google-style.xml" https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
