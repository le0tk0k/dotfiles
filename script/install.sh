#!/bin/bash

set -eu

print_info() {
  printf "\e[36;1m[INFO] %s\e[m\n" "$*"
}

start_message() {
  print_info '-----------------------------------'
  print_info '     _       _    __ _ _           '
  print_info '  __| | ___ | |_ / _(_) | ___  ___ '
  print_info ' / _  |/ _ \| __| |_| | |/ _ \/ __|'
  print_info '| (_| | (_) | |_|  _| | |  __/\__ \ '
  print_info ' \__ _|\___/ \__|_| |_|_|\___||___/'
  print_info '                                   '
  print_info '-----------------------------------'
}

install_zinit() {
  local ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
  if [[ -d "${ZINIT_HOME}" ]]; then
    print_info "Zinit is already installed."
  else
    print_info "Installing Zinit..."
    mkdir -p "$(dirname "${ZINIT_HOME}")"
    git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
  fi
}

link_dotfiles() {
  # todo: set the variable DOTFILES_DIR.
  ln -snfv "$HOME/dotfiles/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
  ln -snfv "$HOME/dotfiles/config/starship/starship.toml" "$HOME/.config/starship.toml"
  ln -snfv "$HOME/dotfiles/config/git/config" "$HOME/.config/git/config"
  ln -snfv "$HOME/dotfiles/config/git/ignore" "$HOME/.config/git/ignore"
  ln -snfv "$HOME/dotfiles/config/gh/config.yml" "$HOME/.config/gh/config.yml"
  ln -snfv "$HOME/dotfiles/config/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua"
  ln -snfv "$HOME/dotfiles/config/vim/.vimrc" "$HOME/.vimrc"
  ln -snfv "$HOME/dotfiles/config/zsh/.zshenv" "$HOME/.zshenv"
  ln -snfv "$HOME/dotfiles/config/zsh/.zshrc" "$HOME/.config/zsh/.zshrc"
}

start_message
install_zinit
