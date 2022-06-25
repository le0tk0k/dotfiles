#!/bin/bash

set -eu

# todo set the variable DOTFILES_DIR and link other config files.
ln -snfv "$HOME/dotfiles/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
ln -snfv "$HOME/dotfiles/config/starship/starship.toml" "$HOME/.config/starship.toml"
ln -snfv "$HOME/dotfiles/config/git/.gitconfig" "$HOME/.gitconfig"
ln -snfv "$HOME/dotfiles/config/git/.gitignore_global" "$HOME/.gitignore_global"
ln -snfv "$HOME/dotfiles/config/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua"
ln -snfv "$HOME/dotfiles/config/vim/.vimrc" "$HOME/.vimrc"
ln -snfv "$HOME/dotfiles/config/zsh/.zshrc" "$HOME/.zshrc"
