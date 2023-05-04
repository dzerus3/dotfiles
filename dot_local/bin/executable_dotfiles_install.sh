#!/bin/zsh

# Quit if any command fails
set -e

# Change shell to zsh
chsh -s /bin/zsh

# Necessary for clean installation
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Create necessary directories if they don't already exist
mkdir -p $HOME/.config
mkdir -p $HOME/.local/{state,share,bin}
mkdir -p $HOME/pics/{screenshots,wallpapers}

# Create dotfile git directory
git init --bare $HOME/.local/share/dotfiles
# Set dotfile origin to Github
git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME\
    remote add origin https://github.com/dzerus3/dotfiles
# Pull in the dotfiles
git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME\
    pull origin master
# Set Github as upstream
git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME\
    branch --set-upstream-to=origin/master master

echo "Enabling plugins..."

# Creates zsh plugins folder (zsh will auto install them from there)
mkdir -p $HOME/.config/zsh/plugins

# Installs Packer (neovim package manager)
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

# Disables neovim plugins temporarily
sed -i '1i\
    vim.g.disableplugins = 1
' $XDG_CONFIG_HOME/nvim/init.lua

# Runs PackerSync to get all other plugins installed
nvim -c "PackerSync" $(mktemp)

# Re-enable neovim plugins
sed '1d' $XDG_CONFIG_HOME/nvim/init.lua > $XDG_CONFIG_HOME/nvim/tmp.lua
mv $XDG_CONFIG_HOME/nvim/tmp.lua $XDG_CONFIG_HOME/nvim/init.lua

echo "Neovim may have given you a treesitter-related error. This is normal."
echo "Installation seems to have finished successfully. Yay."
