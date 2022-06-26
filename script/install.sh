#!/bin/bash

set -eu

# todo: set the variable DOTFILES_DIR.
ln -snfv "$HOME/dotfiles/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
ln -snfv "$HOME/dotfiles/config/starship/starship.toml" "$HOME/.config/starship.toml"
ln -snfv "$HOME/dotfiles/config/git/config" "$HOME/.config/git/config"
ln -snfv "$HOME/dotfiles/config/git/ignore" "$HOME/.config/git/ignore"
ln -snfv "$HOME/dotfiles/config/gh/config.yml" "$HOME/.config/gh/config.yml"
ln -snfv "$HOME/dotfiles/config/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua"
ln -snfv "$HOME/dotfiles/config/vim/.vimrc" "$HOME/.vimrc"
ln -snfv "$HOME/dotfiles/config/zsh/.zshrc" "$HOME/.zshrc"
