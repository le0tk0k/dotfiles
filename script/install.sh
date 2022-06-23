#!/bin/bash

set -eu

# todo set the variable DOTFILES_DIR and link other config files.
ln -snfv "$HOME/dotfiles/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
ln -snfv "$HOME/dotfiles/config/starship/starship.toml" "$HOME/.config/starship.toml"
