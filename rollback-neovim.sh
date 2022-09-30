#!/bin/bash

PREV_COMMIT_HASH="$(cat neovim-prev-installed-commit-hash)"

cd ./neovim || exit

echo "Installing Pprevious commit hash $PREV_COMMIT_HASH"
git checkout "$PREV_COMMIT_HASH"
git pull

sudo make distclean
sudo make CMAKE_BUILD_TYPE=Release install

git --no-pager log --decorate=short --pretty=oneline -n1 | awk '{ print $1}' >neovim-current-installed-commit-hash

mv neovim-current-installed-commit-hash ../
cd ../
