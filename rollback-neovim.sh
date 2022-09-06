#!/bin/bash

PREV_COMMIT_HASH"$(cat neovim-prev-installed-commit-hash)"

git checkout $"PREV_COMMIT_HASH"
git pull

sudo make distclean
sudo make CMAKE_BUILD_TYPE=Release install

git --no-pager log --decorate=short --pretty=oneline -n1 | awk '{ print $1}' >neovim-current-installed-commit-hash
