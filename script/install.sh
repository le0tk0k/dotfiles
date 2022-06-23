#!/bin/bash

set -eu

ln -snfv $HOME/dotfiles/config/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
ln -snfv $HOME/dotfiles/config/starship/starship.toml $HOME/.config/starship.toml
