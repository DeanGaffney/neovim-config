#!/bin/bash
if [ ! -d "./neovim" ]; then
	# if neovim does not exist clone it and install it
	git clone git@github.com:neovim/neovim.git
	bash ./install-neovim-head.sh
fi

npm i -g eslint_d
npm install -g dockerfile-language-server-nodejs
npm i -g yaml-language-server

cargo install stylua

brew install hadolint
brew install shellcheck
brew install shfmt
brew install lua-language-server
brew install golangci-lint
brew upgrade golangci-lint
brew install gopls
brew install jq

pip install proselint
pip install codespell
pip install cfn-lint
