#!/bin/bash

cd ./neovim || exit

git --no-pager log --decorate=short --pretty=oneline -n1 | awk '{ print $1}' >neovim-prev-installed-commit-hash

mv neovim-prev-installed-commit-hash ../

git checkout master
git pull

sudo make distclean
sudo make CMAKE_BUILD_TYPE=Release install

git --no-pager log --decorate=short --pretty=oneline -n1 | awk '{ print $1}' >neovim-current-installed-commit-hash

mv neovim-current-installed-commit-hash ../

cd ../
