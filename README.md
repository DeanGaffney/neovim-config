# neovim-config
Configuration for neovim

# Install
- Run the following:
```bash
bash ./install.sh
```

- Inside neovim run the following:
```
:Lazy
```
- Install all plugins using the GUI that is presented

# Update Neovim
```bash
bash ./install-neovim-head.sh
```
- Place the commit hash for the currently installed version of neovim into a file called `neovim-prev-installed-commit-hash`
- Pull the latest changes from the neovim master branch
- Build neovim
- Place the latest commit hash into a file called `neovim-current-installed-commit-hash`

## Rolling Back
- It's possible when updating neovim that some issues arise.
- To roll back to your previous version of neovim run the following:
```bash
bash ./rollback-neovim.sh
```
