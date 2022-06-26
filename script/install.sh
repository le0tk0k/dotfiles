#!/bin/bash

set -eu

DOTFILES_DIR="${HOME}/dotfiles"
CONFIG_DIR="${DOTFILES_DIR}/config"

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

clone() {
  if [[ -d "${DOTFILES_DIR}" ]]; then
    print_info "dotfiles repository already exists"
  else
    print_info "Cloning dotfiles repository..."
    git clone https://github.com/le0tk0k/dotfiles.git "${DOTFILES_DIR}"
  fi
}

install_homebrew() {
  if [[ $(command -v brew) ]]; then
    print_info "Homebrew is already installed"
  else
    print_info "Installing Homebrew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    print_info "Done"
    print_info "Restoring Homebrew packages..."
    brew bundle install --file="${DOTFILES_DIR}/config/homebrew/Brewfile"
  fi
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
  print_info "Linking config files..."
  mkdir -p "${HOME}/.config/{gh,git,tmux,zsh}"
  ln -snfv "${CONFIG_DIR}/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
  ln -snfv "${CONFIG_DIR}/starship/starship.toml" "$HOME/.config/starship.toml"
  ln -snfv "${CONFIG_DIR}/git/config" "$HOME/.config/git/config"
  ln -snfv "${CONFIG_DIR}/git/ignore" "$HOME/.config/git/ignore"
  ln -snfv "${CONFIG_DIR}/gh/config.yml" "$HOME/.config/gh/config.yml"
  ln -snfv "${CONFIG_DIR}/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua"
  ln -snfv "${CONFIG_DIR}/vim/.vimrc" "$HOME/.vimrc"
  ln -snfv "${CONFIG_DIR}/zsh/.zshenv" "$HOME/.zshenv"
  ln -snfv "${CONFIG_DIR}/zsh/.zshrc" "$HOME/.config/zsh/.zshrc"
}

start_message
clone
install_homebrew
install_zinit
link_dotfiles
